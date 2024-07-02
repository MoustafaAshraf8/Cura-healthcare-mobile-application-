import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/class/AppTheme.dart';

import 'package:image_picker/image_picker.dart';
import '../FileCard.dart';

void getCustomFileSourceModalBottomSheet(
    BuildContext context, Function addNewImage, Function addNewFile) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            //Gallery
            Future _pickImageFromGallery() async {
              XFile? returnImage =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (returnImage == null) return;
              // setState(() {
              //   // selectedIMage = File(returnImage.path);
              //   // _image = File(returnImage.path).readAsBytesSync();
              // });
              addNewImage(returnImage);
              Navigator.of(context).pop(); //close the model sheet
            }

            //Camera
            Future _pickImageFromCamera() async {
              XFile? returnImage =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (returnImage == null) return;
              // setState(() {
              //   // selectedIMage = File(returnImage.path);
              //   // _image = File(returnImage.path).readAsBytesSync();
              // });
              addNewImage(returnImage);
              Navigator.of(context).pop();
            }

            //file
            Future _pickFile() async {
              FilePickerResult? returnFile =
                  await FilePicker.platform.pickFiles();
              if (returnFile == null) return;
              // setState(() {
              //   // selectedIMage = File(returnImage.path);
              //   // _image = File(returnImage.path).readAsBytesSync();
              // });
              print(returnFile.count);
              addNewFile(returnFile);
              Navigator.of(context).pop();
            }

            return Container(
                padding: EdgeInsets.all(10),
                child: DraggableScrollableSheet(
                    initialChildSize: 0.2,
                    minChildSize: 0.2,
                    maxChildSize: 0.9,
                    expand: false,
                    builder: (context, scrollController) => SafeArea(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            _pickImageFromGallery();
                                          },
                                          child: const SizedBox(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.image,
                                                  size: 70,
                                                ),
                                                Text("Gallery")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            _pickImageFromCamera();
                                          },
                                          child: const SizedBox(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.camera_alt,
                                                  size: 70,
                                                ),
                                                Text("Camera")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            _pickFile();
                                          },
                                          child: const SizedBox(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.file_present,
                                                  size: 70,
                                                ),
                                                Text("Files")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))))));
          }));
}
