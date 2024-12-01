import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/project.dart';


class TestimonialsCarousel extends StatefulWidget {
  final List<Testimonial> testimonials;
  final bool isDesktop;

  const TestimonialsCarousel({super.key, required this.testimonials, required this.isDesktop});

  @override
  TestimonialsCarouselState createState() => TestimonialsCarouselState();
}

class TestimonialsCarouselState extends State<TestimonialsCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = screenWidth < 600 ? 16 : 36; // Adjust base font size based on screen width

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.isDesktop ? 300 : 400,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            aspectRatio: widget.isDesktop ? 2.0 : 1.0,
            viewportFraction: widget.isDesktop ? 0.8 : 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.testimonials.map((testimonial) {
            return Builder(
              builder: (BuildContext context) {
                bool isActive = widget.testimonials.indexOf(testimonial) == _currentIndex;
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: isActive ? 1.0 : 0.0, // Show/hide text based on current index
                        child: Text(
                          testimonial.testimonial,
                          style: GoogleFonts.lato(
                            fontSize: baseFontSize, // Responsive font size for testimonial text
                            color: Colors.white, // Text color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        testimonial.name,
                         style: GoogleFonts.pacifico( // Signature-style font
                      fontSize: baseFontSize * 0.75, // Slightly smaller font size for name
                          fontWeight: FontWeight.bold,
                          color: Colors.teal, // Name color
                          ),
                      ),
                      Text(
                        testimonial.company,
                        style: TextStyle(
                          fontSize: baseFontSize * 0.66, // Smaller font size for company name
                          fontWeight: FontWeight.bold,
                          color: Colors.grey, // Company name color
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.testimonials.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.white : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
