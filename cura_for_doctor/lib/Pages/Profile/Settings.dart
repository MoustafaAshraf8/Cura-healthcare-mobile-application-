import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:cura_for_doctor/Pages/Login.dart';
import 'package:cura_for_doctor/Pages/Profile/HelpCenterEmail.dart';
import 'package:cura_for_doctor/Pages/Profile/MyAccount.dart';
import 'package:cura_for_doctor/Pages/Profile/Policy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool valNotify1 = true;
  bool valNotify2 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     AppLocalizations.of(context)!.settings,
        //     style:
        //         const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //   ),
        //   backgroundColor: Color.fromARGB(255, 9, 52, 87),
        //   centerTitle: true,
        //   leading: IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //       )),
        // ),
        body: Column(
          children: [
            ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
            SecondaryHeaderContainer(
              child: Column(children: [
                //Header AppBar
                SizedBox(
                  height: height * 0.005,
                ),
                TAppBar(
                  showBackArrow: true,
                  title: Text("Settings",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ],
                ),
              ]),
            ),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: ListView(
            //     children: [
            //       const SizedBox(
            //         height: 40,
            //       ),
            //       const Row(
            //         children: [
            //           Icon(
            //             Icons.person,
            //             color: Colors.blue,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             "Account Settings",
            //             style: TextStyle(
            //                 fontSize: 22, fontWeight: FontWeight.bold),
            //           )
            //         ],
            //       ),
            //       const Divider(
            //         height: 20,
            //         thickness: 1,
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),

            settignsOptions(context, "Account Information", MyAccount(), true),
            // settignsOptions(context, "Language", Profile(), false),
            SizedBox(height: 13.sp),
            settignsOptions(context, "Help Center", MyAccount(), false),
            SizedBox(height: 13.sp),
            settignsOptions(context, "Policy & Agreements", policy(), true),
            SizedBox(height: 13.sp),
            onAoff(AppLocalizations.of(context)!.notif, valNotify1,
                onChangeFunction1),
            onAoff("Dark Mode", valNotify2, onChangeFunction2),

            SizedBox(
              height: height * 0.2,
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // OutlinedButton(
                    //   onPressed: () {},
                    //   style: OutlinedButton.styleFrom(
                    //       fixedSize: const Size(400, 40),
                    //       side: BorderSide(width: 1, color: Colors.red),
                    //       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20))),
                    //   child: Text(
                    //     AppLocalizations.of(context)!.log,
                    //     style: const TextStyle(
                    //         fontSize: 16,
                    //         letterSpacing: 2.2,
                    //         color: Colors.red),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.log,
                        style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 208, 19, 6),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // OutlinedButton(
                    //   onPressed: () {},
                    //   style: OutlinedButton.styleFrom(
                    //       side: BorderSide(width: 1, color: Colors.red),
                    //       fixedSize: const Size(400, 40),
                    //       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20))),
                    //   child: const Text(
                    //     "Deactivate Account",
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         letterSpacing: 2.2,
                    //         color: Colors.red),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Deactivate Account",
                        style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 208, 19, 6),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Padding onAoff(String title, bool value, Function onChange) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Colors.blue,
                trackColor: Colors.grey,
                value: value,
                onChanged: (bool newValue) {
                  onChange(newValue);
                },
              ))
        ],
      ),
    );
  }

  GestureDetector settignsOptions(
      BuildContext context, String title, Widget Destination, bool condition) {
    return GestureDetector(
      onTap: () {
        if (condition) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Destination),
          );
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title, textAlign: TextAlign.center),
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
                                      builder: (context) => HelpCenterEmail()));
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
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
