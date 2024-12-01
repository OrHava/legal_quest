// lib/domain/entities/project.dart

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String demoLink;
  final List<String> images; // List of project images
   final String? playStoreLink;  

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    required this.demoLink,
    required this.images, // Add this to include project-specific images
     this.playStoreLink,
  });
}


class Testimonial {
  final String name;
  final String company;
  final String testimonial;

  Testimonial({required this.name, required this.company, required this.testimonial});
}
