import 'package:flutter/material.dart';

void main() {
  runApp(const Splash2());
}

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SplashScreen2(),
        ]),
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
      width: 412,
      height: 869,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF5FFEC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 348.67,
            top: 204.58,
            child: Container(
              width: 65,
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(),
            ),
          ),
          Positioned(
            left: 176,
            top: 696,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
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
          Positioned(
            left: 30,
            top: 749,
            child: Container(
              width: 333,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 252,
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
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 43,
            top: 13,
            child: Container(
              width: 297,
              height: 21,
              child: Stack(
                children: [
                  Positioned(
                    left: 245,
                    top: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 261,
                    top: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 1,
                    child: Text(
                      '11:11',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 19,
            top: 591,
            child: SizedBox(
              width: 358,
              height: 48,
              child: Text(
                'Contribute to sustainability with easy, effective recycling.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF636363),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: 82,
            top: 549,
            child: Text(
              'Join the Green Movement',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
    ],
    );
    }
}