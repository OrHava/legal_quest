import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

import '../../generated/l10n.dart';


class StarryBackground extends StatefulWidget {
  const StarryBackground({super.key});

  @override
  StarryBackgroundState createState() => StarryBackgroundState();
}

class StarryBackgroundState extends State<StarryBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Star> _stars = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    
    // Generate stars
    for (int i = 0; i < 20; i++) {
      _stars.add(Star(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 2 + 0.5,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: StarPainter(
            stars: _stars,
            animationValue: _controller.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class Star {
  final double x;
  final double y;
  final double size;

  Star({required this.x, required this.y, required this.size});
}

class StarPainter extends CustomPainter {
  final List<Star> stars;
  final double animationValue;

  StarPainter({required this.stars, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (var star in stars) {
      final opacity = (sin(animationValue * 2 * pi + star.x * 10) + 1) / 2;
      paint.color = Colors.white.withOpacity(0.3 + opacity * 0.7);
      
      canvas.drawCircle(
        Offset(star.x * size.width, star.y * size.height),
        star.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SignatureBrandName extends StatelessWidget {
  const SignatureBrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust font size based on screen width
        double fontSize = constraints.maxWidth > 600 ? 16 : 16; // Smaller font for mobile screens
        return CustomPaint(
          size: Size(constraints.maxWidth, 60),
          painter: SignaturePainter(),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: FittedBox(  // Use FittedBox to make the text fit within the available space
                fit: BoxFit.scaleDown,
                child: Text(
              overflow: TextOverflow.ellipsis,
                  S.of(context).appTitle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: fontSize,
                    color: Colors.white,
                    
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class SignaturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0  // Slightly thicker stroke for a bolder look
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(0, height * 0.6);
    for (var i = 0; i < width; i++) {
      final x = i.toDouble();
      final y = height * 0.6 + 
                sin(x * 0.02) * 8 +  // Reduced amplitude for subtlety
                sin(x * 0.005) * 15; // Reduced amplitude for subtlety
      path.lineTo(x, y);
    }

    // Add flourish
    path.quadraticBezierTo(width * 0.8, height * 0.15, width, height * 0.4);  // Adjusted control points for elegance

    canvas.drawPath(path, paint);

    // Add static sparkle effect
    final sparkle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (var i = 0; i < 5; i++) {
      final x = cos(i * 0.5) * width * 0.3 + width * 0.5; // Reduced sparkle spread
      final y = sin(i * 0.5) * height * 0.3 + height * 0.5; // Reduced sparkle spread
      canvas.drawCircle(Offset(x, y), 2.0, sparkle);  // Slightly larger sparkles
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}




// Custom FooterLink widget
class FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FooterLink({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[300], fontSize: 14),
      ),
    );
  }
}