import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/Pages/Profile/HelpCenterEmail.dart';
import 'package:cura_for_doctor/Pages/Profile/MyAccount.dart';
import 'package:cura_for_doctor/Pages/Profile/Notifictions.dart';
import 'package:cura_for_doctor/Pages/Profile/Settings.dart';
import 'package:cura_for_doctor/model/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  Doctor? doctor;
  Profile({this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
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
                whiteBackArrow: true,
                title: Text("Profile",
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                actions: [
                  Icon(
                    Icons.person_pin_rounded,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ],
              ),
              //Profile Picture
              Center(
                child: SizedBox(
                  height: 80.sp,
                  width: 80.sp,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      //Profile "Big Circle"
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://10.0.2.2:80/image/6618fb7db4dfa8686e3fe4d7")),
                      //Camera Icon "Small Circle"
                      Positioned(
                        right: -12,
                        bottom: 0,
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: const BorderSide(color: Colors.white),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/img/Icons/Camera.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),

          ///Body --Page Body-- (White Part)
          SizedBox(height: height * 0.01),
          Text(
            "Welcome ..!",
            style: TextStyle(
              color: const Color.fromARGB(255, 8, 55, 102),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
              indent: 30.sp,
              endIndent: 30.sp,
              thickness: 2.5,
              height: height * 0.05,
              color: const Color.fromARGB(255, 8, 55, 102)),
          Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.person),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "My Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyAccount()));
                  },
                ),
                SizedBox(height: height * 0.02),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.circle_notifications),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                ),
                SizedBox(height: height * 0.02),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.settings),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
                SizedBox(height: height * 0.02),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.help_center_outlined),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Help Center",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Help Center",
                              textAlign: TextAlign.center,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Contact our Support",
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HelpCenterEmail()));
                                      },
                                      child: const Text(
                                        "Email US",
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Ask Our ChatBot",
                                        style: TextStyle(fontSize: 15),
                                      )),
                                )
                              ],
                            ),
                          );
                        });
                  },
                ),
                SizedBox(height: height * 0.02),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.logout_rounded),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: height * 0.01),
                Divider(
                    indent: 30.sp,
                    endIndent: 30.sp,
                    thickness: 2.5,
                    height: height * 0.05,
                    color: const Color.fromARGB(255, 8, 55, 102)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
