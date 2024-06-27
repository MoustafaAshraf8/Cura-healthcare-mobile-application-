// ignore_for_file: deprecated_member_use

import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/Pages/MainLayout.dart';
import 'package:cura_for_doctor/api/doctorSignUp.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadCertificate extends StatefulWidget {
  final Doctor doctor;
  UploadCertificate({required this.doctor, super.key});

  @override
  State<UploadCertificate> createState() => _UploadCertificateState();
}

Future<String> getValue() async {
  await Future.delayed(Duration(seconds: 2));
  return "";
}

class _UploadCertificateState extends State<UploadCertificate> {
  Future<String> x = getValue();
  XFile? _image;
  XFile? _image2;

  bool loading = false;

  Future getImage(bool isCamera, bool isCard) async {
    XFile? image;
    if (isCamera) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (isCard) {
        _image = image;
      } else {
        _image2 = image;
      }
    });
  }

  void revertLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void signUpDoctor() async {
    final bool success =
        await doctorSignUp(doctor: widget.doctor, revertLoading: revertLoading);

    if (success) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => MainLayout()), (route) => false);
    } else {
      revertLoading();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        opacity: 0.1,
        blur: 5,
        progressIndicator:
            CircularProgressIndicator(color: AppTheme.customBlue),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
              SecondaryHeaderContainer(
                child: Column(children: [
                  TAppBar(
                    showBackArrow: true,
                    title: Text("Upload Data",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    actions: [
                      // Icon(
                      //   Icons.upload,
                      //   color: Colors.white,
                      //   size: 24.sp,
                      // ),
                    ],
                  ),
                ]),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Doctor Syndicate card:",
                      style: TextStyle(
                          color: AppTheme.customBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    SizedBox(height: 5.sp),
                    _image == null
                        ? Container(
                            height: height * 0.25,
                            width: width * 0.95,
                            child: Image.asset(
                              "assets/img/Icons/upload.png",
                              fit: BoxFit.contain,
                            ),
                          )
                        : Image.file(
                            File(_image!.path),
                            height: height * 0.25,
                            width: width * 0.85,
                            fit: BoxFit.cover,
                          ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.customBlue,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: AppTheme.customGold,
                            ),
                            onPressed: () {
                              getImage(true, true);
                            },
                          ),
                        ),
                        SizedBox(width: 10.sp),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.customBlue,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(
                              Icons.photo_library_outlined,
                              color: AppTheme.customGold,
                            ),
                            onPressed: () {
                              getImage(false, true);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.sp),
                    Divider(color: AppTheme.customBlue, thickness: 2),
                    SizedBox(height: 5.sp),
                    Text(
                      "Doctor Certificates:",
                      style: TextStyle(
                          color: AppTheme.customBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    SizedBox(height: 5.sp),
                    _image2 == null
                        ? Container(
                            height: height * 0.25,
                            width: width * 0.95,
                            child: Image.asset("assets/img/Icons/upload.png",
                                fit: BoxFit.contain),
                          )
                        : Image.file(File(_image2!.path),
                            height: height * 0.25,
                            width: width * 0.85,
                            fit: BoxFit.cover),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.customBlue,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: AppTheme.customGold,
                            ),
                            onPressed: () {
                              getImage(true, false);
                            },
                          ),
                        ),
                        SizedBox(width: 10.sp),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.customBlue,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(
                              Icons.photo_library_outlined,
                              color: AppTheme.customGold,
                            ),
                            onPressed: () {
                              getImage(false, false);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                    SizedBox(
                      height: 42.sp,
                      width: 140.sp,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStatePropertyAll(AppTheme.customBlue),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(12.sp)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: signUpDoctor,
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: AppTheme.customGold, fontSize: 16.sp)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
