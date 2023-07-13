import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
      );
    } catch (e) {
      print('Error occurred during logout: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred during logout.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(

        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Notification Settings'),
            subtitle: Text('Configure app notifications'),
            trailing: Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings screen
            },
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('Change app language'),
            trailing: Icon(Icons.language),
            onTap: () {
              // Navigate to language selection screen
            },
          ),
          ListTile(
            title: Text('Units'),
            subtitle: Text('Select preferred unit system'),
            trailing: Icon(Icons.format_list_numbered),
            onTap: () {
              // Navigate to unit selection screen
            },
          ),
          ListTile(
            title: Text('About'),
            subtitle: Text('View app information'),
            trailing: Icon(Icons.info),
            onTap: () {
              // Navigate to about screen
            },
          ),
          ListTile(
            title: Text('Logout'),
            subtitle: Text('Sign out of the app'),
            trailing: Icon(Icons.logout),
            onTap: () => _logout(context),

          ),
        ],
      ),
    );
  }
}
