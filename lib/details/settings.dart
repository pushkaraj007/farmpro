import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


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
        const SnackBar(content: Text('Error occurred during logout.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(

        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Notification Settings'),
            subtitle: const Text('Configure app notifications'),
            trailing: const Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings screen
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('Change app language'),
            trailing: const Icon(Icons.language),
            onTap: () {
              // Navigate to language selection screen
            },
          ),
          ListTile(
            title: const Text('Units'),
            subtitle: const Text('Select preferred unit system'),
            trailing: const Icon(Icons.format_list_numbered),
            onTap: () {
              // Navigate to unit selection screen
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('View app information'),
            trailing: const Icon(Icons.info),
            onTap: () {
              // Navigate to about screen
            },
          ),
          ListTile(
            title: const Text('Logout'),
            subtitle: const Text('Sign out of the app'),
            trailing: const Icon(Icons.logout),
            onTap: () => _logout(context),

          ),
        ],
      ),
    );
  }
}
