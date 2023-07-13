import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>
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
        begin: Color(0xFF9FFDA1),
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
        title: Text('Contact Us'),
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
                  _colorAnimation.value!.withOpacity(0.6),
                  _colorAnimation.value!.withOpacity(0.3),
                  _colorAnimation.value!.withOpacity(0),
                ],
              ),
            ),
              padding: EdgeInsets.fromLTRB(16, 16, 16, 200),
              child: Column(
                children: [
                  SizedBox(height: 210.0),
                  _buildSection(
                    title: 'Contact Us',
                    content:
                    'If you have any questions or suggestions, feel free to reach out to us.',
                    contacts: [
                      ContactInfo(
                        icon: Icons.email,
                        text: 'Email:- pushkarajchaudhary@gmail.com',
                      ),
                      ContactInfo(
                        icon: Icons.phone,
                        text: 'Phone:- \n +91 7756894207',
                      ),
                      ContactInfo(
                        icon: Icons.home_outlined,
                        text: 'Address :- Chaudhari Wada , Post Chunchale , 425302'
                      ),
                    ],
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
          if (contacts != null) ..._buildContactInfo(contacts),
        ],
      ),
    );
  }

  List<Widget> _buildContactInfo(List<ContactInfo> contacts) {
    return contacts
        .map(
          (contact) => ListTile(
        leading: Icon(
          contact.icon,
          color: Colors.grey[800],
        ),
        title: Text(
          contact.text,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[800],
          ),
        ),
      ),
    )
        .toList();
  }
}

class ContactInfo {
  final IconData icon;
  final String text;

  ContactInfo({required this.icon, required this.text});
}
