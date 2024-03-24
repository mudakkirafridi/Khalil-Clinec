import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/screens/add.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: TextStyle(color: MyColors.whiteColor),
        ),
      ),
      body: Expanded(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Patients").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data!.docs[index]['images']),
                              ),
                              title:
                                  Text(snapshot.data!.docs[index]['Full Name']),
                              subtitle: Row(
                                children: [
                                  Text(snapshot.data!.docs[index]['Gender']),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(snapshot.data!.docs[index]['Age']),
                                ],
                              ));
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: Icon(
          Icons.add,
          color: MyColors.whiteColor,
        ),
      ),
    );
  }
}
