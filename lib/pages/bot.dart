import 'package:flutter/material.dart';

void main() {
  runApp(const bot());
}

class bot extends StatelessWidget {
  const bot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SplashScreen1(),
        ]),
      ),
    );
  }
}

class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF5FFED),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(47.69),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 41.02,
                top: 15.26,
                child: Container(
                  width: 283.30,
                  height: 20.03,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 233.70,
                        top: 0,
                        child: Container(
                          width: 15.26,
                          height: 15.26,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                      ),
                      Positioned(
                        left: 248.96,
                        top: 0,
                        child: Container(
                          width: 15.26,
                          height: 15.26,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0.95,
                        child: Text(
                          '11:11',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.40,
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
                left: 206.99,
                top: 326.23,
                child: Opacity(
                  opacity: 0,
                  child: Container(
                    width: 10.49,
                    height: 10.49,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 73.13,
                top: 759.43,
                child: Container(
                  width: 304.58,
                  padding: const EdgeInsets.only(
                    top: 14.19,
                    left: 13.65,
                    right: 19.10,
                    bottom: 14.19,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.09,
                        color: const Color(0xFFE4E4E4),
                      ),
                      borderRadius: BorderRadius.circular(12.01),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 22.93,
                    children: [
                      SizedBox(
                        width: 192.29,
                        child: Text(
                          'Ask me anything...',
                          style: TextStyle(
                            color: const Color(0xFF7D7984) /* Textgrey */,
                            fontSize: 15.28,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 765.88,
                child: Container(
                  width: 40.12,
                  height: 40.12,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [const Color(0xFF8EC23F), const Color(0xFF8EC23F)],
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 480.71,
                child: Container(
                  width: 349.33,
                  padding: const EdgeInsets.symmetric(horizontal: 12.55, vertical: 13.10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.09,
                        color: const Color(0xFF49B02D) /* Primary */,
                      ),
                      borderRadius: BorderRadius.circular(12.01),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4.37,
                        offset: Offset(0, 4.37),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 7.64,
                    children: [
                      Container(
                        width: 28.38,
                        height: 29.48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/28x29"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288.20,
                        child: Text(
                          'Suggest creative ways to reuse plastic bottles',
                          style: TextStyle(
                            color: const Color(0xFF1E242A) /* Text---Dark */,
                            fontSize: 15.28,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 563.67,
                child: Container(
                  width: 349.33,
                  padding: const EdgeInsets.symmetric(horizontal: 13.65, vertical: 12.01),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.09,
                        color: const Color(0xFF49B02D) /* Primary */,
                      ),
                      borderRadius: BorderRadius.circular(12.01),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4.37,
                        offset: Offset(0, 4.37),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 13.10,
                    children: [
                      Container(
                        width: 22.92,
                        height: 25.11,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/23x25"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 286.02,
                        child: Text(
                          'Give me eco-friendly tips for reducing household waste',
                          style: TextStyle(
                            color: const Color(0xFF1E242A) /* Text---Dark */,
                            fontSize: 15.28,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 22.92,
                top: 644.81,
                child: Container(
                  width: 349.33,
                  padding: const EdgeInsets.symmetric(horizontal: 13.65, vertical: 13.10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.09,
                        color: const Color(0xFF49B02D) /* Primary */,
                      ),
                      borderRadius: BorderRadius.circular(12.01),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4.37,
                        offset: Offset(0, 4.37),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8.73,
                    children: [
                      Container(
                        width: 25.11,
                        height: 22.92,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/25x23"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288.20,
                        child: Text(
                          'Find the nearest recycling center to my location',
                          style: TextStyle(
                            color: const Color(0xFF1E242A) /* Text---Dark */,
                            fontSize: 15.28,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 88.50,
                top: 439,
                child: Text(
                  'Some ideas to get you started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF1E242A) /* Text---Dark */,
                    fontSize: 15.24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 204,
                child: Text(
                  'Good evening, Manar\nWhat can I help you with today?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF1E242A) /* Text---Dark */,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Container(
                  width: 39,
                  height: 39,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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