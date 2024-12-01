import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../generated/l10n.dart';


class AnimatedTitleWidget extends StatefulWidget {
  final bool isDesktop;

  const AnimatedTitleWidget({super.key, required this.isDesktop});

  @override
  AnimatedTitleWidgetState createState() => AnimatedTitleWidgetState();
}

class AnimatedTitleWidgetState extends State<AnimatedTitleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child:  Text(
      S.of(context).welcome_title,
               textAlign: TextAlign.center,

  style: GoogleFonts.playfairDisplay( // or GoogleFonts.raleway()
  
    textStyle:  TextStyle(
    fontSize: widget.isDesktop ? 48 : 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
    ),
  ),
)
      ),
    );
  }
}