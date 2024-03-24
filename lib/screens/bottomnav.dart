import 'package:flutter/material.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/screens/home.dart';
import 'package:kalil_clinec/screens/patient_list.dart';
import 'package:kalil_clinec/screens/profile.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentindex = 0;
  List<Widget> pages = [
    const AppointmentScreen(),
    const PatientListScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          selectedItemColor: MyColors.primaryColor,
          onTap: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Appointments', icon: Icon(Icons.list_alt_outlined)),
            BottomNavigationBarItem(
                label: 'Patient List', icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ]),
    );
  }
}
