import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalil_clinec/components/button.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/screens/otp_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController phoneController = TextEditingController();
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
              'Sign in',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1 / 3,
            ),
            const Text(
              'Mobile Number',
              style: TextStyle(color: MyColors.primaryColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1 / 3,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: '+923078555817',
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

                FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {
                      isload() {
                        isLoading = false;
                      }
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      isload() {
                        isLoading = false;
                      }
                    },
                    codeSent: (String verificationId, int? token) {
                      isload() {
                        isLoading = false;
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OtpScreen(verifyId: verificationId)));
                    },
                    codeAutoRetrievalTimeout: (String resend) {
                      isload() {
                        isLoading = false;
                      }
                    },
                    phoneNumber: phoneController.text.toString());
              },
              child: MyButton(
                  loading: isLoading,
                  title: 'Continue',
                  backColor: MyColors.primaryColor,
                  textColor: MyColors.whiteColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1 / 3,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColors.blackColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Image(
                        height: 30,
                        width: 30,
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png')),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1 / 6,
                    ),
                    const Text('Continue with Google'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Text(
              'By continuing you agree to our Terms of service \n and Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(color: MyColors.grayColor),
            )
          ],
        ),
      ),
    );
  }
}
