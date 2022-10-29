import 'package:flutter/material.dart';
import 'package:flutter_homework_1/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff252B42),
            ),
          ),
          const Center(
            child: Text(
              'Welcome!',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()))
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 550),
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                'Log out',
                style: TextStyle(
                  color: Color(0xff252B42),
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
