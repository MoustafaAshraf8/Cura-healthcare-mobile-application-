import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/Pages/Profile/MyAccount.dart';

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
                  height: 5,
                ),
                TAppBar(
                  showBackArrow: true,
                  title: Text("Edit My Account",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 27,
                    ),
                  ],
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
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
                        bottom: -5,
                        right: -15,
                        child: ElevatedButton(
                          onPressed: () {
                            // imageGpicker();
                          },
                          style:
                              ElevatedButton.styleFrom(shape: CircleBorder()),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                color: Colors.blue),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            )),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 600,
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
                          // const SizedBox(
                          //   height: 30,
                          // ),
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
                                      fontSize: 15,
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
                                      fontSize: 15,
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
      padding: EdgeInsets.only(bottom: 30),
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
            hintStyle: const TextStyle(
              fontSize: 16,
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
