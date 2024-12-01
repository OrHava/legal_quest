import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
        padding: const EdgeInsets.all(50), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Information Collection', 'We collect only necessary information to improve your experience.'),
              _buildSection('Use of Information', 'Your information is used for website analytics and inquiries.'),
              _buildSection('Data Protection', 'We use industry-standard measures to protect your data.'),
              _buildSection('Third-Party Services', 'We may use third-party services with their own policies.'),
              _buildSection('Your Rights', 'You can access, correct, or delete your personal information.'),
              _buildSection('Changes to This Policy', 'Check this page for policy updates.'),
              _buildSection('Contact Us', 'For inquiries, email us at privacy@orhavaportfolio.com.'),
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
        'Privacy Policy',
        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 10,
    );
  }
}
