import 'package:flutter/material.dart';
import 'package:kalil_clinec/constants/colors.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patients List',
          style: TextStyle(color: MyColors.whiteColor),
        ),
      ),
    );
  }
}
