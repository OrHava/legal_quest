import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/project.dart';
import '../pages/project_details_page.dart';

class ProjectShowcase extends StatelessWidget {
  final List<Project> projects;
  final BoxConstraints constraints;

  const ProjectShowcase({super.key, required this.projects, required this.constraints});

  @override
  Widget build(BuildContext context) {
    // Set the number of columns dynamically based on screen width
    int columnCount = constraints.maxWidth < 600 ? 1 : 2; // 1 column for small screens, 2 for larger screens
// Instead, just return the Wrap directly for testing
return Wrap(
  spacing: 20,
  runSpacing: 50,
  alignment: WrapAlignment.center,
  children: List.generate(
    projects.length,
    (index) => ProjectCard(
      project: projects[index],
      width: (constraints.maxWidth - 40) / columnCount - 20,
    ),
  ),
);
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  final double width;

  const ProjectCard({super.key, required this.project, required this.width});

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
   late ImageProvider _imageProvider;

  
  @override
  void initState() {
    super.initState();
    _loadImage();
  }


void _loadImage() {
    _imageProvider = AssetImage(widget.project.imageUrl);
    _imageProvider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((_, __) {
        if (mounted) {
          setState(() {
          });
        }
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailsPage(project: widget.project),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          constraints: const BoxConstraints(maxWidth: 700),
          transform: Matrix4.identity()..scale(_isHovered ? 1.03 : 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Container(
                    constraints: const BoxConstraints(
        maxHeight: 200, // Adjust this value based on your needs
      ),child: _buildOptimizedImage()),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.project.title,
                  style: GoogleFonts.playfairDisplay(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// Replace this with a known good asset for testing
Widget _buildOptimizedImage() {
  return Image.asset(
    widget.project.imageUrl,// Change this to a valid image path for testing
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          ),
          const SizedBox(height: 10),
          Text(
            'Failed to load image: ${error.toString()}',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    },
  );
}

}