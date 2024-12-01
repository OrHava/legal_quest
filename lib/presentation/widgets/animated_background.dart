import 'dart:math';
import 'package:flutter/material.dart';

class SpaceBackgroundPainter extends CustomPainter {
  final double scrollOffset;
  final double animationValue;
  final Random random = Random(42);
  final List<Star> stars = [];
  final List<Nebula> nebulae = [];
  final List<Galaxy> galaxies = [];

  SpaceBackgroundPainter({required this.scrollOffset, required this.animationValue}) {
    _generateStars();
    _generateNebulae();
    _generateGalaxies();
  }

  void _generateStars() {
    for (int i = 0; i < 300; i++) {
      stars.add(Star(
        x: random.nextDouble(),
        y: random.nextDouble(),
        z: random.nextDouble() * 2 - 1,
        size: random.nextDouble() * 1.5 + 0.5,
        brightness: random.nextDouble() * 0.5 + 0.5,
        color: _getStarColor(),
        twinkleSpeed: random.nextDouble() * 5 + 1,
      ));
    }
  }

  void _generateNebulae() {
    for (int i = 0; i < 1; i++) {
      nebulae.add(Nebula(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 0.5 + 0.3,
        color: _getNebulaColor(),
        shape: _generateNebulaShape(),
      ));
    }
  }

  void _generateGalaxies() {
    for (int i = 0; i < 2; i++) {
      galaxies.add(Galaxy(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 0.3 + 0.2,
        rotation: random.nextDouble() * 2 * pi,
        spiralTightness: random.nextDouble() * 2 + 1,
      ));
    }
  }

Color _getStarColor() {
  final colors = [
    const Color(0xFFFFFFFF), // White
    const Color(0xFFF6F3EA), // Warm White
    const Color(0xFFE6E3D5), // Pale Yellow-White
    const Color(0xFFFFF4E8), // Pale Orange-White
    const Color(0xFFFFEBD5), // Light Orange
    const Color(0xFFFFE4B5), // Pale Gold
    const Color(0xFFB5D3E7), // Pale Blue
    const Color(0xFFADD8E6), // Light Blue
    const Color(0xFFFFB6C1), // Light Pink
    const Color(0xFFE6E6FA), // Lavender
  ];

  // Weighted distribution to make some colors more common
  final weights = [
    30, // White (most common)
    25, // Warm White
    20, // Pale Yellow-White
    10, // Pale Orange-White
    5,  // Light Orange
    3,  // Pale Gold
    3,  // Pale Blue
    2,  // Light Blue
    1,  // Light Pink
    1,  // Lavender
  ];

  int totalWeight = weights.reduce((a, b) => a + b);
  int randomWeight = random.nextInt(totalWeight);
  
  for (int i = 0; i < colors.length; i++) {
    if (randomWeight < weights[i]) {
      return colors[i];
    }
    randomWeight -= weights[i];
  }

  return colors[0]; // Fallback to white
}
  Color _getNebulaColor() {
    final colors = [
      Colors.purple,
      Colors.blue,
      Colors.pink,
      Colors.teal,
      Colors.green,
    ];
    return colors[random.nextInt(colors.length)].withOpacity(0.1);
  }

  Path _generateNebulaShape() {
    final path = Path();
    final numPoints = random.nextInt(5) + 5;
    for (int i = 0; i < numPoints; i++) {
      final angle = 2 * pi * i / numPoints;
      final radius = 0.5 + random.nextDouble() * 0.5;
      final x = cos(angle) * radius;
      final y = sin(angle) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF000B18);
    canvas.drawRect(Offset.zero & size, paint);

    _drawNebulae(canvas, size);
    _drawStars(canvas, size);
  }

  

  void _drawNebulae(Canvas canvas, Size size) {
    for (final nebula in nebulae) {
      final center = Offset(
        nebula.x * size.width,
        (nebula.y * size.height + scrollOffset * 0.05) % size.height,
      );
      final radius = nebula.size * size.width;
      final gradient = RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [
          nebula.color,
          nebula.color.withOpacity(0.0),
        ],
      );
      final rect = Rect.fromCircle(center: center, radius: radius);
      final paint = Paint()
        ..shader = gradient.createShader(rect)
        ..blendMode = BlendMode.screen;
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.scale(radius, radius);
      canvas.drawPath(nebula.shape, paint);
      canvas.restore();
    }
  }
  void _drawStars(Canvas canvas, Size size) {
    final zoomFactor = 1 + (animationValue * 2);
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    for (final star in stars) {
      double x = star.x * size.width;
      double y = (star.y * size.height + scrollOffset * (1 + star.z) * 0.1) % size.height;
      double scale = 1 / (star.z * zoomFactor + 1);
      x = (x - centerX) * scale + centerX;
      y = (y - centerY) * scale + centerY;

      x += (x - centerX) * animationValue * 0.1;
      y += (y - centerY) * animationValue * 0.1;

      final brightness = (star.brightness + sin(animationValue * star.twinkleSpeed) * 0.2).clamp(0.0, 1.0);

    // Create a radial gradient for the star
    final gradient = RadialGradient(
      colors: [
        star.color.withOpacity(brightness),
        star.color.withOpacity(brightness * 0.5),
        star.color.withOpacity(0),
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    // Draw the star with a gradient
      final paint = Paint()
        ..shader = gradient.createShader(Rect.fromCircle(
        center: Offset(x, y),
        radius: star.size * scale * 2,
      ))
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), star.size * scale * 2, paint);

    // Add a small glow effect
    final glowPaint = Paint()
      ..color = star.color.withOpacity(brightness * 0.2)
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, star.size * scale);

    canvas.drawCircle(Offset(x, y), star.size * scale * 1.5, glowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant SpaceBackgroundPainter oldDelegate) =>
      oldDelegate.scrollOffset != scrollOffset || oldDelegate.animationValue != animationValue;
}

class Star {
  final double x;
  final double y;
  final double z;
  final double size;
  final double brightness;
  final Color color;
  final double twinkleSpeed;

  Star({
    required this.x,
    required this.y,
    required this.z,
    required this.size,
    required this.brightness,
    required this.color,
    required this.twinkleSpeed,
  });
}

class Nebula {
  final double x;
  final double y;
  final double size;
  final Color color;
  final Path shape;

  Nebula({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.shape,
  });
}

class Galaxy {
  final double x;
  final double y;
  final double size;
  final double rotation;
  final double spiralTightness;

  Galaxy({
    required this.x,
    required this.y,
    required this.size,
    required this.rotation,
    required this.spiralTightness,
  });
}

class SpaceParallaxBackground extends StatefulWidget {
  final ScrollController scrollController;

  const SpaceParallaxBackground({super.key, required this.scrollController});

  @override
  SpaceParallaxBackgroundState createState() => SpaceParallaxBackgroundState();
}

class SpaceParallaxBackgroundState extends State<SpaceParallaxBackground> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([widget.scrollController, _animationController]),
      builder: (context, child) {
        double offset = 0.0;
        if (widget.scrollController.hasClients) {
          offset = widget.scrollController.offset;
        }
        return CustomPaint(
          painter: SpaceBackgroundPainter(
            scrollOffset: offset,
            animationValue: _animation.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}














class SpaceBackgroundPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    canvas.drawRect(Offset.zero & size, paint);

    final starPaint = Paint()..color = Colors.white;
    final random = Random(42); // Fixed seed for consistent star pattern

    for (int i = 0; i < 200; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2;
      canvas.drawCircle(Offset(x, y), radius, starPaint);
    }

    // Add some colored "nebulas"
    _drawNebula(canvas, size, Colors.purple.withOpacity(0.1), random);
    _drawNebula(canvas, size, Colors.blue.withOpacity(0.1), random);
  }

  void _drawNebula(Canvas canvas, Size size, Color color, Random random) {
    final paint = Paint()
      ..color = color
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    for (int i = 0; i < 5; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 100 + 50;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

