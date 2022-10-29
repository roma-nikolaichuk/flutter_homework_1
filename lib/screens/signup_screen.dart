import 'package:flutter/material.dart';
import 'package:flutter_homework_1/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              'Sign up Screen',
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
