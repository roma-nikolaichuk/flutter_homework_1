import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_homework_1/screens/home_screen.dart';
import 'package:flutter_homework_1/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252B42),
      body: SingleChildScrollView(
        child: _page(),
      ),
    );
  }

  Widget _page() {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              _buildLogo(),
              _buildInputField(
                  hintText: 'Username or email address',
                  icon: const Icon(Icons.person, color: Color(0xff252B42)),
                  controller: usernameController,
                  isPassword: false),
              _buildInputField(
                  hintText: 'Password',
                  icon: const Icon(
                    Icons.vpn_key,
                    color: Color(0xff252B42),
                  ),
                  controller: passwordController,
                  isPassword: true),
              _buildForgottenPasswordField(),
              _buildRememberMeField(),
              _buildLoginButton(),
              _buildExtraText(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 100, bottom: 100),
      child: SvgPicture.asset('images/logo-white.svg'),
    );
  }

  Widget _buildInputField(
      {required String hintText,
      required icon,
      required TextEditingController controller,
      required bool isPassword}) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      alignment: Alignment.center,
      child: TextField(
        style: const TextStyle(color: Color(0xff252B42)),
        controller: controller,
        obscureText: isPassword,
        cursorColor: const Color(0xff252B42),
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff252B42)),
          labelStyle: const TextStyle(color: Color(0xff252B42)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.white;
  }

  Widget _buildRememberMeField() {
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Checkbox(
              value: isRememberMe,
              checkColor: const Color(0xff252B42),
              fillColor: MaterialStateProperty.resolveWith(getColor),
              onChanged: (bool? value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
            const Text(
              'Remember me',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ));
  }

  Widget _buildForgottenPasswordField() {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: const Text(
          'Forgotten your password?',
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => {},
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: () => {checkAuthorization()},
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 125),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Text(
          'Log in',
          style: TextStyle(
            color: Color(0xff252B42),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  Widget _buildExtraText() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account? ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()))
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ));
  }

  void checkAuthorization() {
    debugPrint('Username: ${usernameController.text}');
    debugPrint('Password: ${passwordController.text}');
    debugPrint('Remember me: ${isRememberMe.toString()}');

    if (usernameController.text == 'admin' &&
        passwordController.text == '123456') {
      if (isRememberMe) {
        // Доробити, якщо логін та пароль був правильний та стояла галочка "запам'ятати",
        // то наступного разу після splash одразу відкривати екран HomeScree.
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      debugPrint("The username or password is incorrect!");
    }
  }
}
