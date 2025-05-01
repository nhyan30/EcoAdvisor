import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SMSVerificationPage(),
    );
  }
}

class SMSVerificationPage extends StatefulWidget {
  const SMSVerificationPage({super.key});

  @override
  State<SMSVerificationPage> createState() => _SMSVerificationPageState();
}

class _SMSVerificationPageState extends State<SMSVerificationPage> {
  int secondsRemaining = 30;
  late final Future<void> timer;

  @override
  void initState() {
    super.initState();
    timer = startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> startTimer() async {
    while (secondsRemaining > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          secondsRemaining--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Enter Verification Code',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We’ve sent an SMS with an activation code to your phone +971 56 404 8390',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF636363),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                secondsRemaining > 0
                    ? 'Resend code in $secondsRemaining seconds'
                    : 'Didn’t receive a code?',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xFF8F8F8F),
                ),
              ),
            ),
            if (secondsRemaining == 0)
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      secondsRemaining = 30;
                      startTimer();
                    });
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF66AA00),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                // handle verification and navigation
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
                    'Verify',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
