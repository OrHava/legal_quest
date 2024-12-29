import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../domain/entities/project.dart';
import '../../generated/l10n.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          project.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Animated background
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(seconds: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple.shade900,
                    Colors.black87,
                    Colors.indigo.shade900,
                  ],
                ),
              ),
            ).animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            ).shimmer(
              duration: 3.seconds,
              color: Colors.white.withAlpha(10),
            ),
          ),
          // Star particles in background
          const Positioned.fill(
            child: AnimatedParticles(),
          ),
          // Scrollable content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80), // Space for AppBar
                    // Image Slider with animation
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: isMobile ? 20 / 25 : 25 / 9,
                        viewportFraction: isMobile ? 0.9 : 0.8,
                        enlargeCenterPage: true,
                        enlargeFactor: isMobile ? 0.15 : 0.1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                      items: project.images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(20),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ).animate().scale(
                              duration: 300.milliseconds,
                              begin: const Offset(0.98, 0.98),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    // Glass effect for project description
                    Center(
                      child: GlassContainer(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            project.description,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ).animate()
                        .fadeIn(duration: 0.8.seconds)
                        .slideY(begin: 0.2, duration: 0.5.seconds),
                    ),
                    const SizedBox(height: 20),
                    // Skills Chip (Tech Stack)
                    Center(
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: project.techStack.map((tech) {
                          return Chip(
                            label: Text(tech),
                            backgroundColor: Colors.grey[200],
                            labelStyle: TextStyle(color: Colors.grey[800]),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Demo Button
                    Center(
                      child: _buildDemoButton(context, project),
                    ),
                    const SizedBox(height: 20),
                    // Optional Play Store Button
                    if (project.playStoreLink != null)
                      Center(
                        child: _buildPlayStoreButton(context, project),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Demo Button
  Widget _buildDemoButton(BuildContext context, Project project) {
    return OutlinedButton.icon(
      onPressed: () => launchURL(project.demoLink),
      icon: const Icon(Icons.open_in_new, size: 18),
      label:  Text( S.of(context).view_Demo),
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        side: BorderSide(color: Theme.of(context).primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  // Play Store Button
  Widget _buildPlayStoreButton(BuildContext context, Project project) {
    return InkWell(
      onTap: () => launchURL(project.playStoreLink!),
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/google-play-badge.png',
        height: 40,
      ),
    );
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (kIsWeb) {
      if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
        throw 'Could not launch $url';
      }
    } else {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
  }
}

// Animated particles widget for dynamic background
class AnimatedParticles extends StatelessWidget {
  const AnimatedParticles({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(20, (index) {
          return Positioned(
            left: index * 20.0,
            top: index * 15.0,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(50),
                shape: BoxShape.circle,
              ),
            ).animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            ).moveY(
              begin: 0,
              end: 20,
              duration: (index * 500).milliseconds,
              curve: Curves.easeInOut,
            ).fadeIn(duration: 1.seconds),
          );
        }),
      ),
    );
  }
}

// Glass container for description text
class GlassContainer extends StatelessWidget {
  final Widget child;

  const GlassContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(10),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withAlpha(20)),
          ),
          child: child,
        ),
      ),
    );
  }
}
