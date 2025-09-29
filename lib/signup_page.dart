import 'package:flutter/material.dart';

import 'main_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-Up"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  else if (value[0] != value[0].toUpperCase()) {
                    return 'First letter must be capital';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  _password = value;
                  return null;
                },
                onSaved: (value) => _password = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  } else if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Account created successfully'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  // 1. Define the destination page
                                  pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),

                                  // 2. Define the transition
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    // Use the 'animation' to control the Opacity
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child, // The destination page (MainPage)
                                    );
                                  },

                                  // 3. (Optional) Set the transition duration
                                  transitionDuration: const Duration(milliseconds: 500),
                                  // You can adjust this duration (e.g., 500ms for half a second)
                                ),
                              );
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
