import 'package:flutter/material.dart';

void main() {
  runApp(const Splash2());
}

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF5FFEC),
      ),
      home: Scaffold(
        body: SplashScreen2(),
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF5FFEC),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          // Removed the time display that was here
          
          // Main image - people recycling
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'images/recycling_people.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          // Title text
          Positioned(
            left: 0,
            right: 0,
            top: 500,
            child: Text(
              'Join the Green Movement',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Subtitle text
          Positioned(
            left: 20,
            right: 20,
            top: 540,
            child: Text(
              'Contribute to sustainability with easy, effective recycling.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF636363),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          
          // Pagination dots
          Positioned(
            left: 0,
            right: 0,
            bottom: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF66AA00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: const Color(0x4C66AA00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 5,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: const Color(0x4C66AA00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Skip text and next button
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(
                      color: const Color(0xFF8F8F8F),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 47,
                    height: 47,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF8EC23F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}