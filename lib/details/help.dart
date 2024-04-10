import 'package:farmpro/details/faqpage.dart';
import 'package:flutter/material.dart';
import 'package:farmpro/details/aboutus.dart';
import 'package:farmpro/details/contactus.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF4BAE4F),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            color: const Color(0xFFD8E0D3),
            height: MediaQuery.of(context).size.height * 0.9,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 400.0,
            left: 0,
            right: 0,
// bottom: 400,
            child: Column(
              children: [
                Image.asset(
                  'images/FarmPro-logos.jpeg',
                  height: 300.0,
                  width: 500.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 0.0),
                const Text(
                  'How can we assist you?',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 40,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildOption(
                      icon: Icons.contact_support,
                      title: 'FAQ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> FAQPage())
                        );
                              },
                    ),
                    const SizedBox(height: 24.0),
                    _buildOption(
                      icon: Icons.email,
                      title: 'Contact Us',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactUs()),
                        );
                      },
                    ),
                    const SizedBox(height: 24.0),
                    _buildOption(
                      icon: Icons.info,
                      title: 'About',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUsScreen()),
                        );
                      },
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

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF4BAE4F), size: 28.0),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0),
          ],
        ),
      ),
    );
  }
}
