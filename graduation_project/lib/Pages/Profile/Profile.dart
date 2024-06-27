import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/Pages/Profile/HelpCenterEmail.dart';
import 'package:graduation_project/Pages/Profile/MyAccount.dart';
import 'package:graduation_project/Pages/Profile/Notifictions.dart';
import 'package:graduation_project/Pages/Profile/Settings.dart';
import 'package:graduation_project/class/AppTheme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
          SecondaryHeaderContainer(
              child: Column(
            children: [
              //Header AppBar
              const SizedBox(
                height: 5,
              ),
              const TAppBar(
                showBackArrow: false,
                title: Text("",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                // actions: [
                //   Icon(
                //     Icons.person_pin_rounded,
                //     color: Colors.white,
                //     size: 27,
                //   ),
                // ],
              ),
              //Profile Picture
              Center(
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      //Profile "Big Circle"
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/img/Logo/Cura.png"),
                        // backgroundColor: AppTheme.customBlue,
                      ),
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
          const SizedBox(height: 15),
          const Text(
            "Welcome ..!",
            style: TextStyle(
              color: Color.fromARGB(255, 8, 55, 102),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
              indent: 30,
              endIndent: 30,
              thickness: 2.5,
              height: 50,
              color: Color.fromARGB(255, 8, 55, 102)),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                  title: const Text(
                    "My Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyAccount()));
                  },
                ),
                const SizedBox(height: 25),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.circle_notifications),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                ),
                const SizedBox(height: 25),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.settings),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
                const SizedBox(height: 25),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.help_center_outlined),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text(
                    "Help Center",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
                const SizedBox(height: 25),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: const Color.fromARGB(255, 8, 55, 102),
                  leading: const Icon(Icons.logout_rounded),
                  iconColor: const Color.fromARGB(255, 255, 195, 106),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                const Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.5,
                    height: 50,
                    color: Color.fromARGB(255, 8, 55, 102)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
