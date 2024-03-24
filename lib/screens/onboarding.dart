import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/screens/login.dart';

class MyOnboardingScreen extends StatefulWidget {
  const MyOnboardingScreen({super.key});

  @override
  State<MyOnboardingScreen> createState() => _MyOnboardingScreenState();
}

class _MyOnboardingScreenState extends State<MyOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: MyColors.primaryColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: OnBoardingSlider(
          indicatorAbove: true,
          onFinish: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LogInScreen()));
          },
          totalPage: 3,
          headerBackgroundColor: MyColors.primaryColor,
          finishButtonText: 'Next',
          trailing: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()));
              },
              child: const Text(
                'Login',
                style: TextStyle(color: MyColors.grayColor),
              )),
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor: MyColors.primaryColor,
          ),
          skipTextButton: const Text(
            'Skip',
            style: TextStyle(color: MyColors.grayColor),
          ),
          background: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height * .7 / 2,
                    image: const AssetImage(
                      'assets/images/pic1.png',
                    ),
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height * .7 / 2,
                    image: const AssetImage(
                      'assets/images/pic2.png',
                    ),
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height * .7 / 2,
                    image: const AssetImage(
                      'assets/images/pic3.png',
                    ),
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ],
          speed: 1.8,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .9 / 2,
                  ),
                  const Text(
                    'Never miss an appoinment !',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'App will let you know about all upcoming \n appointment on time',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: MyColors.grayColor),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .9 / 2,
                    ),
                    const Text(
                      'Instantly schedule appointments',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Quicly schedule appointments with easy user \n interface',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: MyColors.grayColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .9 / 2,
                  ),
                  const Text(
                    'Keep patient records with you !',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'App has unique feature to create patient profile \n and keep all related documents.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: MyColors.grayColor),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
