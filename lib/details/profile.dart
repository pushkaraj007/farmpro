import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User _user;
  Map<String, dynamic>? _userData;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      final userData = await _firestore.collection('users').doc(_user.uid).get();

      if (userData.exists) {
        setState(() {
          _userData = userData.data() as Map<String, dynamic>;
          _nameController.text = _userData?['name'] ?? '';
          _contactNoController.text = _userData?['contactNo'] ?? '';
          _addressController.text = _userData?['address'] ?? '';
          _emailController.text = _userData?['email'] ?? '';
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void updateProfile() async {
    try {
      await _firestore.collection('users').doc(_user.uid).update({
        'name': _nameController.text,
        'contactNo': _contactNoController.text,
        'address': _addressController.text,
        'email': _emailController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully.'),
        ),
      );

      toggleEditing(); // Disable editing after profile update
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update profile.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard is displayed
      // body: SingleChildScrollView(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/frame2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            left: 70.0,
            right: 60.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _userData?['email'] ?? 'N/A',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Name:',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: _isEditing
                      ? TextField(
                    controller: _nameController,
                    style: const TextStyle(fontSize: 24.0),
                  )
                      : Text(
                    _userData?['name'] ?? 'N/A',
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contact No:',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: _isEditing
                      ? TextField(
                    controller: _contactNoController,
                    style: const TextStyle(fontSize: 24.0),
                  )
                      : Text(
                    _userData?['contactNo'] ?? 'N/A',
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Address:',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: _isEditing
                      ? TextField(
                    controller: _addressController,
                    style: const TextStyle(fontSize: 23.0),
                  )
                      : Text(
                    _userData?['address'] ?? 'N/A',
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
                const SizedBox(height: 50.0),
                if (!_isEditing)
                  ElevatedButton(
                    onPressed: toggleEditing,
                    child: const Text('Edit Information' ,style: TextStyle(fontSize: 16)),
                  ),
                if (_isEditing)
                  ElevatedButton(
                    onPressed: updateProfile,
                    child: const Text('Update Profile'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
