import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kalil_clinec/screens/onboarding.dart';

class SplashService {
  splashOver(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MyOnboardingScreen()));
    });
  }
}
