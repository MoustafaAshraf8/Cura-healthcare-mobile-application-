import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/Pages/Profile/MyAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditMyAccount extends StatefulWidget {
  const EditMyAccount({super.key});

  @override
  State<EditMyAccount> createState() => _EditMyAccountState();
}

class _EditMyAccountState extends State<EditMyAccount> {
  // File? selectedImage;
  // Uint8List? imageaya;
  bool isObscurePass = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: const Text(
          //     'Profile',
          //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //   ),
          //   backgroundColor: Color.fromARGB(255, 9, 52, 87),
          //   centerTitle: true,
          //   leading: IconButton(
          //       onPressed: () {
          //         Navigator.push(
          //             context, MaterialPageRoute(builder: (context) => Profile()));
          //       },
          //       icon: Icon(
          //         Icons.arrow_back,
          //         color: Colors.white,
          //       )),
          // ),
          resizeToAvoidBottomInset: false,
          body: Column(children: [
            ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
            SecondaryHeaderContainer(
                child: Column(
              children: [
                //Header AppBar
                SizedBox(
                  height: height * 0.005,
                ),
                TAppBar(
                  showBackArrow: true,
                  title: Text("Edit My Account",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ],
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 80.sp,
                        height: 80.sp,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          shape: BoxShape.circle,
                          // image: DecorationImage(
                          //   fit: BoxFit.cover,
                          //   image: AssetImage('assets/selfie.jpg'),
                          // ),
                        ),
                      ),
                      Positioned(
                        bottom: -3.sp,
                        right: -14.sp,
                        child: ElevatedButton(
                          onPressed: () {
                            // imageGpicker();
                          },
                          style:
                              ElevatedButton.styleFrom(shape: CircleBorder()),
                          child: Container(
                            height: 30.sp,
                            width: 30.sp,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                color: Colors.blue),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.sp,
                ),
              ],
            )),
            Container(
              padding: EdgeInsets.only(left: 15.sp, top: 15.sp, right: 15.sp),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: height * 0.65,
                      child: ListView(
                        children: [
                          buildtextfield(
                              "First Name", "Enter Your First Name", false),
                          buildtextfield(
                              "Last Name", "Enter Your Last Name", false),
                          buildtextfield("Email", "Enter Your Email", false),
                          buildtextfield(
                              "Contact Number", "Enter Your Number", false),
                          buildtextfield("Password", "Enter Password", true),
                          buildtextfield("City", "Enter Your City", false),
                          buildtextfield(
                              "Address", "Enter Your Detailed Address", false),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyAccount()));
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyAccount()));
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ])),
    );
  }

  Widget buildtextfield(String labelText, String placeholder, bool isPassText) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: TextField(
        obscureText: isPassText ? isObscurePass : false,
        decoration: InputDecoration(
            suffixIcon: isPassText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePass = !isObscurePass;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }

  // Future imageGpicker() async {
  //   final returnedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (returnedImage == null) return;
  //   setState(() {
  //     selectedImage = File(returnedImage!.path);
  //     imageaya = File(returnedImage.path).readAsBytesSync();
  //   });
  // }
}
