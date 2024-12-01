import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookiePolicyPage extends StatelessWidget {
  const CookiePolicyPage({super.key});

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
              _buildSection(
                'What Are Cookies',
                'Cookies are small text files that are placed on your computer by websites that you visit.',
              ),
              _buildSection(
                'How We Use Cookies',
                'We use cookies to analyze website traffic and optimize your website experience.',
              ),
              _buildSection(
                'Types of Cookies We Use',
                '1. Essential cookies: Necessary for the website to function properly.\n'
                '2. Analytics cookies: Help us understand how visitors interact with the website.\n'
                '3. Preference cookies: Remember your settings and preferences.',
              ),
              _buildSection(
                'Managing Cookies',
                'Most web browsers allow you to control cookies through their settings preferences. '
                'However, limiting cookies may affect your experience on our website.',
              ),
              _buildSection(
                'Changes to This Policy',
                'We may update our Cookie Policy from time to time. We will notify you of any changes '
                'by posting the new Cookie Policy on this page.',
              ),
              _buildSection(
                'Contact Us',
                'If you have any questions about our Cookie Policy, please contact us at cookies@orhavaportfolio.com.',
              ),
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
    'Cookie Policy',
        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 10,
    );
  }
}

