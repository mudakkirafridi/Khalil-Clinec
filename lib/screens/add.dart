import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalil_clinec/constants/colors.dart';
import 'package:kalil_clinec/screens/home.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController medicalHistoryController = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Schedule New Appointment',
          style: TextStyle(fontSize: 18, color: MyColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Enter Mobile No',
                style: TextStyle(color: MyColors.grayColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 45,
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      fillColor: MyColors.txtFieldColor,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Full Name',
                style: TextStyle(color: MyColors.grayColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 45,
                child: TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                      fillColor: MyColors.txtFieldColor,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Age',
                          style: TextStyle(color: MyColors.grayColor),
                        ),
                        Container(
                          height: 45,
                          child: TextField(
                            controller: ageController,
                            decoration: InputDecoration(
                                fillColor: MyColors.txtFieldColor,
                                filled: true,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(color: MyColors.grayColor),
                        ),
                        Container(
                          height: 45,
                          child: TextField(
                            controller: genderController,
                            decoration: InputDecoration(
                                fillColor: MyColors.txtFieldColor,
                                filled: true,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Address',
                style: TextStyle(color: MyColors.grayColor),
              ),
              Container(
                height: 45,
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      fillColor: MyColors.txtFieldColor,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Medical History',
                style: TextStyle(color: MyColors.grayColor),
              ),
              Container(
                height: 45,
                child: TextField(
                  controller: medicalHistoryController,
                  decoration: InputDecoration(
                      fillColor: MyColors.txtFieldColor,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () async {
                  final pickedimage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedimage != null) {
                    image = File(pickedimage.path);
                    setState(() {});
                  }
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: image != null
                        ? Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(image!.path).absolute,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Icon(Icons.image),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () async {
                  UploadTask uploadTask = FirebaseStorage.instance
                      .ref("Full Name")
                      .child(phoneController.text.toString())
                      .putFile(image!);
                  TaskSnapshot taskSnapshot = await uploadTask;
                  String newUrl = await taskSnapshot.ref.getDownloadURL();
                  int id = DateTime.now().microsecondsSinceEpoch;
                  FirebaseFirestore.instance
                      .collection('Patients')
                      .doc(id.toString())
                      .set({
                    'Phone No': phoneController.text.toString(),
                    'Full Name': fullNameController.text.toString(),
                    'Age': ageController.text.toString(),
                    'Gender': genderController.text.toString(),
                    'Address': addressController.text.toString(),
                    'Medical History': medicalHistoryController.text.toString(),
                    "images": newUrl.toString()
                  }).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Your appointment is succefully Granted')));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppointmentScreen()));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    'Next',
                    style: TextStyle(color: MyColors.whiteColor),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
