import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:farmpro/screens/signup_screen.dart';
import 'package:farmpro/screens/dashboard_screen.dart';
import '../details/forgotpasswordscreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _username = '';
  String _password = '';
  String _errorMessage = '';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final userQuerySnapshot = await _firestore
            .collection('users')
            .where('username', isEqualTo: _username)
            .limit(1)
            .get();

        if (userQuerySnapshot.docs.isNotEmpty) {
          final userDocument = userQuerySnapshot.docs.first;
          final userEmail = userDocument['email'];

          final userCredential = await _auth.signInWithEmailAndPassword(
            email: userEmail,
            password: _password,
          );

          // Login successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen(userEmail: userEmail)),
          );
          print('Login successful');
                } else {
          setState(() {
            _errorMessage = 'User not found. Please enter a valid username.';
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          // Password is incorrect
          print('Error: Wrong password');
          setState(() {
            _errorMessage = 'Password is incorrect';
          });
        } else {
          // Handle other authentication errors
          print('Error: ${e.code}');
          setState(() {
            _errorMessage = 'Username or password incorrect';
          });
        }
      } catch (e) {
        // Handle other exceptions
        print('Error: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50.0),
      //   child: AppBar(
      //     title: Text(
      //       '                                Login',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.w600,
      //       ),
      //     ),
      //     backgroundColor: Color(0xFF4BAE4F),
      //     elevation: 0,
      //   ),
      // ),
      resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard is displayed
      body: Stack(
        children: [
        Align(
        alignment: Alignment.center,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/frame5.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to FarmPro',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Kindly Log in to continue our app',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      'images/FarmPro-logos_transparent.png',
                      height: 160.0,
                      width: 3000,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 0),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                            children: [
                        TextFormField(
                        decoration: const InputDecoration(
                        labelText: 'Username',
                            border
                            : OutlineInputBorder(),
                      ),
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
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
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
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      child: const Text('Login', style: TextStyle(fontSize: 18)),
                      onPressed: _login,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                        );
                      },
                      child: const Text('Forgot Password ?', style: TextStyle(fontSize: 16),),
                    ),
                    const SizedBox(height: 0),
                    TextButton(
                      child: const Text('Don\'t have an account ? Sign Up!', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
                    ),
                    if (_errorMessage.isNotEmpty)
                      Text(
                        _errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    ),
    ),
    ),
    ],
    ),
    );
  }
}
