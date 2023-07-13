import 'package:flutter/material.dart';

import 'contactus.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = _animationController.drive(
      ColorTween(
        begin: Color(0xFF4BAE4F),
        end: Color(0xFFFFFFFF),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _colorAnimation.value!,
                  _colorAnimation.value!.withOpacity(0.9),
                  _colorAnimation.value!.withOpacity(0.5),
                  _colorAnimation.value!.withOpacity(0.2),
                ],
              ),
            ),
              padding: EdgeInsets.fromLTRB(16, 16, 16, 45),
              child: Column(
                children: [
                  _buildSection(
                    title: 'Welcome to Farmer Helper App!',
                    content:
                    'To provide farmers with the tools and resources they need to succeed in their agricultural endeavors.',
                  ),
                  SizedBox(height: 16.0),
                  _buildSection(
                    title: 'Our Mission',
                    content:
                    'To provide farmers with the tools and resources they need to succeed in their agricultural endeavors.',
                  ),
                  SizedBox(height: 16.0),
                  _buildSection(
                    title: 'About Us',
                    content:
                    'Farmer Helper App is a platform designed to assist farmers in managing their crops, livestock, and agricultural tasks efficiently. We believe in empowering farmers by equipping them with the knowledge, tools, and resources required for modern farming practices.',
                  ),
                ],
              ),
            );

        },
      ),
    );
  }

  Widget _buildSection(
      {required String title,
        required String content,
        List<ContactInfo>? contacts}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE5FFE5),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

}
