import 'package:flutter/material.dart';
import 'package:eco_advisor/pages/Home.dart';
import 'package:eco_advisor/pages/signup.dart';
void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF5FFEC),
      ),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FFEC),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Image.asset(
            'images/company_logo.png',
            width: 120,
            height: 120,
          ),
          const SizedBox(height: 30),
          const Text(
            'Welcome!',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Log in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF636363),
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF8F8F8F),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF8F8F8F),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF8F8F8F),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              // Navigate to Home page after login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF8EC23F),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF636363),
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the SignUp (login2.dart) page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF66AA00),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
