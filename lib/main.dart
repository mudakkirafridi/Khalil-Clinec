import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/firebase_options.dart';
import 'package:kalil_clinec/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.primaryColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: MyColors.primaryColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
