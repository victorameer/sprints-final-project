import 'package:flutter/material.dart';

import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-In"),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    showDialog(
                        context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Account Sign-In Successfully'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),

                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },

                                  transitionDuration: const Duration(milliseconds: 500),
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
                  child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
