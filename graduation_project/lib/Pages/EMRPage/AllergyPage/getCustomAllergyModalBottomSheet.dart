import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/EMRPage/AllergyPage/getCustomFileSourceModalBottomSheet.dart';
import 'package:graduation_project/api/postNewAllergy.dart';
import 'package:graduation_project/class/AppTheme.dart';
import 'package:graduation_project/model/Allergy.dart';
import 'package:graduation_project/model/CustomFile.dart';
import 'package:graduation_project/model/CustomFileMetaData.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../FileCard.dart';

void getCustomAllergyModalBottomSheet(BuildContext context) {
  TextEditingController allergenTextEditingController = TextEditingController();
  TextEditingController reactionTextEditingController = TextEditingController();
  TextEditingController notesTextEditingController = TextEditingController();
  bool isSevere = false;
  TextEditingController dateTextEditingController = TextEditingController();
  DateTime? selectedDate;
  List<XFile> imageXfileList = [];
  List<FilePickerResult> fileList = [];
  bool inAsyncCall = false;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            void revertLoading() {
              setState(() {
                inAsyncCall = !inAsyncCall;
              });
            }

            void addNewAllergy() async {
              if (allergenTextEditingController.text.length > 0 &&
                  reactionTextEditingController.text.length > 0 &&
                  notesTextEditingController.text.length > 0 &&
                  selectedDate != null) {
                List<CustomFile> customFileList = [];
                imageXfileList.map((img) {
                  print(img.path);
                  File file = File(img.path);

                  Uint8List bytes = file.readAsBytesSync();
                  String base64Image = base64Encode(bytes);
                  String filename = file.path.split('/').last;
                  String encoding = "7bit";
                  String mimeType = file.path.split('/').last.split('.').last;
                  customFileList.add(new CustomFile(
                      base64: base64Image,
                      metadata: new CustomFileMetaData(
                          filename: filename,
                          encoding: encoding,
                          mimeType: mimeType)));
                });
                fileList.map((element) {
                  PlatformFile platformFile = element.files.first;
                  File file = File(platformFile.path as String);
                  Uint8List bytes = file.readAsBytesSync();
                  String base64Image = base64Encode(bytes);
                  String filename = file.path.split('/').last;
                  String encoding = "7bit";
                  String mimeType = file.path.split('/').last.split('.').last;
                  customFileList.add(new CustomFile(
                      base64: base64Image,
                      metadata: new CustomFileMetaData(
                          filename: filename,
                          encoding: encoding,
                          mimeType: mimeType)));
                });
                Allergy allergy = new Allergy(
                    id: "",
                    allergen: allergenTextEditingController.text,
                    reaction: reactionTextEditingController.text,
                    notes: notesTextEditingController.text,
                    diagnosisDate: selectedDate!,
                    severity: (isSevere) ? "severe" : "not severe",
                    file: []);
                // revertLoading();
                // bool result = await postNewAllergy(
                //   allergy: allergy,
                //   customFileList: customFileList,
                // );
                // if (result) {
                //   Navigator.of(context).pop();
                // } else {
                //   revertLoading();
                // }
                print(imageXfileList.length);
              }
            }

            Future<void> _selectDate() async {
              DateTime? selected = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now());
              if (selected != null) {
                setState(() {
                  selectedDate = selected;
                  dateTextEditingController.text =
                      selected.toString().split(" ")[0];
                });
              }
            }

            void addNewImage(XFile xfile) {
              setState(() => imageXfileList.add(xfile));
            }

            void addNewFile(FilePickerResult file) {
              setState(() => fileList.add(file));
            }

            return ModalProgressHUD(
              inAsyncCall: inAsyncCall,
              opacity: 0.1,
              blur: 5,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.8,
                    minChildSize: 0.2,
                    maxChildSize: 0.9,
                    expand: false,
                    builder: (context, scrollController) => SafeArea(
                        child: SingleChildScrollView(
                            child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  addNewAllergy();
                                },
                                icon: Icon(
                                  Icons.save,
                                  color:
                                      (allergenTextEditingController
                                                      .text.length >
                                                  0 &&
                                              reactionTextEditingController
                                                      .text.length >
                                                  0 &&
                                              notesTextEditingController
                                                      .text.length >
                                                  0 &&
                                              selectedDate != null)
                                          ? AppTheme.customBlue
                                          : Colors.grey[300],
                                  size: 30,
                                ))
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.all(10),
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: 8, vertical: 16),
                        //       color: Colors.grey[300],
                        //       child: Row(
                        //         children: [
                        //           Text(
                        //             "Save",
                        //             style: TextStyle(color: Colors.black),
                        //           ),
                        //           IconButton(
                        //             onPressed: () {},
                        //             icon: Icon(Icons.add),
                        //             color: Colors.black,
                        //           )
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: allergenTextEditingController,
                            onChanged: (value) {
                              setState(() =>
                                  allergenTextEditingController.text = value);
                            },
                            minLines: 1,
                            maxLines: 20,
                            decoration: InputDecoration(
                              focusColor: AppTheme.customBlue,
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customBlue, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Allergyen',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: reactionTextEditingController,
                            onChanged: (value) {
                              setState(() =>
                                  reactionTextEditingController.text = value);
                            },
                            minLines: 1,
                            maxLines: 20,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customBlue, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Reaction',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: notesTextEditingController,
                            onChanged: (value) {
                              setState(() =>
                                  notesTextEditingController.text = value);
                            },
                            minLines: 1,
                            maxLines: 20,
                            decoration: InputDecoration(
                              focusColor: AppTheme.customBlue,
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customBlue, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Notes',
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                // fillColor: AppTheme.customBlue,

                                value: isSevere,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSevere = value!;
                                  });
                                },
                              ),
                              Text("Severe")
                            ],
                          ),
                        ),
                        Container(
                            // margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                              controller: dateTextEditingController,
                              onTap: () {
                                _selectDate();
                              },
                              decoration: InputDecoration(
                                  labelText: "Date",
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                    color: AppTheme.customBlue,
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.customBlue))),
                              readOnly: true,
                            )),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: imageXfileList.length,
                          itemBuilder: (context, index) {
                            return Container(
                                // radius: 100,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                child: Image(
                                    image: MemoryImage(
                                        File(imageXfileList[index].path)
                                            .readAsBytesSync())));

                            // File file = File(imageXfileList[index].path);
                            // Uint8List bytes = file.readAsBytesSync();
                            // String base64Image = base64Encode(bytes);
                            // // print(base64Image);
                            // return Text(base64Image);

                            // return Text("image" + " ${index}");
                          },
                          // ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () => getCustomFileSourceModalBottomSheet(
                                context, addNewImage, addNewFile),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF11519b),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: AppTheme.customGold,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        // child:
                      ],
                    ))),
                  )),
            );
          }));
}
