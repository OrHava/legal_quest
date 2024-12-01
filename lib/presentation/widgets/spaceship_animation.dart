import 'package:flutter/material.dart';


class RocketAnimation extends StatelessWidget {
  final AnimationController animationController;

  const RocketAnimation({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        // The rocket starts below the button and flies to the top
        return Positioned(
          bottom: animationController.value * MediaQuery.of(context).size.height,
          left: MediaQuery.of(context).size.width / 2 - 50, // Center the rocket
          child: Image.asset(
            'assets/images/player_ship.png', // Ensure you have the rocket image
            width: 100,
            height: 50,
          ),
        );
      },
    );
  }
}
