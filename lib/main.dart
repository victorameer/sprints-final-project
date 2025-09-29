import 'package:flutter/material.dart';
import 'package:sprints_final_project/login_page.dart';
import 'package:sprints_final_project/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Suwannaphum',
      ),
      home: const MyHomePage(title: 'Shopping App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isConnected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/cart.png'),
                height: 100,
                width: 100,
              ),
              Image.network(
                "http://i.pinimg.com/736x/4f/74/89/4f7489062aa5c4c112943f402d29373c.jpg",
                height: 100,
                width: 100,
              ),
            ],
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: (
              ) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
            ),
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purpleAccent,
              ),
              child: Center(
                child: Text(
                  "Sign-Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: (
              ) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
            ),
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purpleAccent,
              ),
              child: Center(
                child: Text(
                  "Sign-In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
