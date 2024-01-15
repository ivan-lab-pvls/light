import 'package:flutter/material.dart';

import '../../../util/app_routes.dart';

class SplashScreen extends StatefulWidget {
  final String homeRoute;

  const SplashScreen({
    Key? key,
    required this.homeRoute,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateProgress();
  }

  void _simulateProgress() {
    Future.delayed(const Duration(milliseconds: 30), () {
      if (progress < 1.0) {
        setState(() {
          progress += 0.01;
          if (progress > 1.0) {
            progress = 1.0;
          }
        });
        _simulateProgress();
      } else {
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() async {
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[800],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
