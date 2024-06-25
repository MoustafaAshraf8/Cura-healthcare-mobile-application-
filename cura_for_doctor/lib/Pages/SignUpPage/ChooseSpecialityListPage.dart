// ignore_for_file: deprecated_member_use

import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Pages/SignUpPage/UploadCertificate.dart';
import 'package:cura_for_doctor/class/AppTheme.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicalSpeciality {
  final String img;
  final String text;
  final int? id;
  MedicalSpeciality({required this.img, required this.text, required this.id});
}

class ChooseSpecialityListPage extends StatefulWidget {
  final Doctor doctor;
  ChooseSpecialityListPage({required this.doctor, super.key});

  @override
  State<ChooseSpecialityListPage> createState() =>
      _ChooseSpecialityListPageState();
}

class _ChooseSpecialityListPageState extends State<ChooseSpecialityListPage> {
  List<MedicalSpeciality> items = [
    new MedicalSpeciality(
        img: "assets/img/Specialities/Dermatology.jpg",
        text: "Dermatology",
        id: 1),
    MedicalSpeciality(
        img: "assets/img/Specialities/Dentistry.jpg", text: "Dentistry", id: 2),
    MedicalSpeciality(
        img: "assets/img/Specialities/Neurology.jpg", text: "Neurology", id: 3),
    MedicalSpeciality(
        img: "assets/img/Specialities/Orthopedics.jpg",
        text: "Orthopedics",
        id: 4),
    MedicalSpeciality(
        img: "assets/img/Specialities/Pediatrics.jpg",
        text: "Pediatrics",
        id: 5),
    MedicalSpeciality(
        img: "assets/img/Specialities/Psychiatry.jpg",
        text: "Psychiatry",
        id: 6),
    MedicalSpeciality(
        img: "assets/img/Specialities/Cardiology.jpg",
        text: "Cardiology",
        id: 7),
    MedicalSpeciality(
        img: "assets/img/Specialities/Internal Medicine.jpg",
        text: "Internal",
        id: 8),
    MedicalSpeciality(
        img: "assets/img/Specialities/Gynaecology and Infertility.jpg",
        text: "Gynaecology",
        id: 9),
    MedicalSpeciality(
        img: "assets/img/Specialities/Throat.jpg", text: "Throat", id: 10),
    MedicalSpeciality(
        img: "assets/img/Specialities/Diabetes and Endocrinology.jpg",
        text: "Diabetes",
        id: 11),
    MedicalSpeciality(
        img: "assets/img/Specialities/Chest and Respiratory.jpg",
        text: "Respiratory",
        id: 12),
    MedicalSpeciality(
        img: "assets/img/Specialities/Audiology.jpg",
        text: "Audiology",
        id: 13),
    MedicalSpeciality(
        img: "assets/img/Specialities/Andrology and Male Infertility.jpg",
        text: "Andrology",
        id: 14),
    MedicalSpeciality(
        img: "assets/img/Specialities/Allergy and Immunology.jpg",
        text: "Allergy",
        id: 15),
  ];

  int? selected = null;

  @override
  void initState() {
    super.initState();
    print("==============================");
    print(widget.doctor.toJson());
    print("==============================");
  }

  void back() {
    Navigator.of(context).pop();
  }

  void next() {
    widget.doctor.speciality_id = selected;
    // Navigator.of(context).pop();
    print(widget.doctor.speciality_id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UploadCertificate(doctor: widget.doctor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Scaffold(

            // appBar: TAppBar(
            // title: Text(
            //   "Speciality",
            //   style: TextStyle(color: AppTheme.customBlue),
            // ),
            //   // leadingIcon: Icons.arrow_back,
            //   // // leadingOnPressed: back,
            //   showBackArrow: true,
            // ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Speciality",
                style: TextStyle(color: AppTheme.customBlue),
              ),
              leading: InkWell(
                  onTap: back,
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child:
                          Icon(Icons.arrow_back, color: AppTheme.customBlue))),
              actions: [
                InkWell(
                  onTap: (selected != null) ? next : () {},
                  child: Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.arrow_forward,
                      color: (selected != null)
                          ? AppTheme.customBlue
                          : Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text("data"),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: ListView.builder(
                      itemCount: items.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selected = items[index]!.id;
                            });
                            print(items[index]!.id);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            // color: (selected == null ||
                            //         selected != items[index]!.id)
                            //     ? Colors.white
                            //     : AppTheme.customBlue,
                            // width: double.infinity,
                            // height: 40,
                            decoration: BoxDecoration(
                              color: (selected == null ||
                                      selected != items[index]!.id)
                                  ? Colors.white
                                  : AppTheme.customBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              // border: Border.all(
                              //   width: 3,
                              //   color: Colors.green,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      color: Colors.white,
                                    ),
                                    height: 60,
                                    width: 60,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: Image(
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover,
                                        image: AssetImage(items[index].img),
                                      ),
                                    )),
                                SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.1),
                                Text(
                                  items[index].text,
                                  style: TextStyle(
                                      color: (selected == null ||
                                              selected != items[index]!.id)
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                // Container(
                //   width: MediaQuery.sizeOf(context).width * 0.5,
                //   height: MediaQuery.sizeOf(context).height * 0.08,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ButtonStyle(
                //         alignment: Alignment.center,
                //         backgroundColor:
                //             const MaterialStatePropertyAll(Colors.black),
                //         padding: const MaterialStatePropertyAll(
                //             EdgeInsets.all(12.0)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(30.0)))),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Text("Add Certificates",
                //             style:
                //                 TextStyle(color: Colors.white, fontSize: 18.0)),
                //         Icon(Icons.navigate_next_sharp)
                //       ],
                //     ),
                //   ),
                // ),
              ],
            )));
  }
}
