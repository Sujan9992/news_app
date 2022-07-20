import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/backgroundimage.png',
              ),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'We show news for you.',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  child: Text('Skip',
                      style:
                          TextStyle(fontSize: 22, color: Colors.blue.shade300)),
                ),
              ],
            ),
          ),
        ),
      );
}
