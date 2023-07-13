import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmpro/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _email = '';
  String _username = '';
  String _password = '';
  String _name = '';
  String _contactNo = '';
  String _address = '';

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        if (userCredential != null) {
          final user = userCredential.user;

          await _firestore.collection('users').doc(user!.uid).set({
            'name': _name,
            'contactNo': _contactNo,
            'address': _address,
            'email': _email,
            'password': _password,
            'username': _username,
          });

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Signup Successful'),
                content: Text('You have successfully signed up. \n Press OK to continue'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(userEmail: _email),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Signup Error'),
              content: Text('An error occurred while signing up. Please try again.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/frame5.png'),
            fit: BoxFit.fill,
          ),
        ),
    child: Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        title: Text('Sign Up'),
        automaticallyImplyLeading: false, // Remove back button

      ),
      // resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard is displayed
      body: Stack(
        children: [
        Align(
        alignment: Alignment.center,
        child: Container(

          child : Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Center(
              child: SingleChildScrollView(
              child: Form(
              key: _formKey,
              child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/FarmPro-logos_transparent.png',
                    height: 120.0,
                    width: 600,
                    fit: BoxFit.fitWidth,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 14.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  SizedBox(height: 14.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(height: 14.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Contact No'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your contact number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _contactNo = value!;
                    },
                  ),
                  SizedBox(height: 14.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value!;
                    },
                  ),
                  SizedBox(height: 14.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: _signUp,
                  ),
                  ElevatedButton(
                    child: Text('Already have an account? Login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    ),
        )
      ]
    ),
    )
    );

  }
}
