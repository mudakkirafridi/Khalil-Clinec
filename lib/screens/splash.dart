import 'package:flutter/material.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService sp = SplashService();
  @override
  void initState() {
    super.initState();
    sp.splashOver(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                  height: 120,
                  width: 98,
                  image: AssetImage('assets/images/Logo.png')),
            ),
            SizedBox(
              height: 34,
            ),
            Text(
              'Patient Diary',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w700),
            )
          ],
        ));
  }
}
