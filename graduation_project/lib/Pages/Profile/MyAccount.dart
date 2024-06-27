import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/Pages/Profile/EditMyAccount.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
        //         //Navigator.push(context,
        //         //MaterialPageRoute(builder: (context) => settings()));
        //       },
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //       )),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           //Navigator.push(context,
        //           //MaterialPageRoute(builder: (context) => ProfileEdit()));
        //         },
        //         icon: Icon(
        //           Icons.edit,
        //           color: Colors.white,
        //         ))
        //   ],
        // ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
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
                  title: Text("My Account",
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/img/Logo/Cura.png"),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditMyAccount()));
              },
              child: Text(
                "Edit My Account",
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Expanded(
                  child: SizedBox(
                    height: 600,
                    child: ListView(
                      children: [
                        buildLabelfield("First Name", "Youssef", false),
                        buildLabelfield("Last Name", "Wahba", false),
                        buildLabelfield(
                            "Email", "youssef.wahba58@gmail.com", false),
                        buildLabelfield("Contact Number", "0120634690", false),
                        buildLabelfield("Password", "flutter_grad", true),
                        buildLabelfield("Country", "Alexandria", false),
                        buildLabelfield("Address", "21 sirhank loran", false),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabelfield(
      String labelTtext, String labelText2, bool isPassText) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        enabled: false,
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
          labelText: labelTtext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        controller: TextEditingController(text: labelText2),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
