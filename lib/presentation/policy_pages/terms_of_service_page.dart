import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
             padding: const EdgeInsets.all(50), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Acceptance of Terms', 'By using this website, you agree to our Terms of Service.'),
              _buildSection('Use License', 'You may view the website for personal, non-commercial use only.'),
              _buildSection('Disclaimer', 'Materials are provided "as is" with no warranties.'),
              _buildSection('Limitations', 'We are not liable for any damages from the use of our website.'),
              _buildSection('Revisions and Errata', 'Materials may contain errors; we are not responsible for them.'),
              _buildSection('Links', 'We are not responsible for the content of linked sites.'),
              _buildSection('Modifications', 'Terms may be updated without notice.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[300],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

   AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
       'Terms of Service',
        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 10,
    );
  }
}
