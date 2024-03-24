import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalil_clinec/components/button.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/screens/bottomnav.dart';

class OtpScreen extends StatefulWidget {
  String verifyId;
  OtpScreen({super.key, required this.verifyId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  isload() {
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: MyColors.primaryColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Text(
              'Verify Phone No',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1 / 3,
            ),
            const Text(
              'Enter OTP',
              style: TextStyle(color: MyColors.primaryColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1 / 3,
            ),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: '201084',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 169, 167, 167)),
                fillColor: MyColors.txtFieldColor,
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1 / 3,
            ),
            InkWell(
              onTap: () {
                isload() {
                  isLoading = true;
                }

                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verifyId,
                    smsCode: otpController.text.toString());
                try {
                  isload() {
                    isLoading = false;
                  }

                  FirebaseAuth.instance.signInWithCredential(credential);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavScreen()));
                } catch (e) {
                  isload() {
                    isLoading = false;
                  }
                }
              },
              child: MyButton(
                  loading: isLoading,
                  title: 'Verify OTP',
                  backColor: MyColors.primaryColor,
                  textColor: MyColors.whiteColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Center(
              child: Text(
                'Dont recieve the OTP? Restart App',
                textAlign: TextAlign.center,
                style: TextStyle(color: MyColors.grayColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
