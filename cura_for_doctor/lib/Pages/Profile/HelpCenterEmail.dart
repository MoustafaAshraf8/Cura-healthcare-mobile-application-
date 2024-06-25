import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterEmail extends StatefulWidget {
  const HelpCenterEmail({super.key});

  @override
  State<HelpCenterEmail> createState() => _HelpCenterEmailState();
}

class _HelpCenterEmailState extends State<HelpCenterEmail> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        //appBar: appBar(),
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
                  title: Text("Message",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: [
                    Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              child: Expanded(
                child: SizedBox(
                  height: height * 0.6,
                  child: ListView(children: [
                    // Row(
                    //   children: [
                    //     const SizedBox(
                    //       width: 6,
                    //     ),
                    //     Text(
                    //       AppLocalizations.of(context)!.msg,
                    //       style: const TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 22),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.45,
                            width: width * 0.9,
                            child: TextField(
                              expands: true,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 8, 55, 102))),
                                hintText: "Enter your message here ...",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.045,
                          ),
                          // OutlinedButton(
                          //   onPressed: () {},
                          //   style: OutlinedButton.styleFrom(
                          //       side: BorderSide(width: 1, color: Colors.blue),
                          //       fixedSize: const Size(400, 40),
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 20),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(20))),
                          //   child: Text(
                          //     AppLocalizations.of(context)!.sendM,
                          //     style: const TextStyle(
                          //         fontSize: 16,
                          //         letterSpacing: 2.2,
                          //         color: Colors.blue),
                          //   ),
                          // ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              AppLocalizations.of(context)!.sendM,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 8, 55, 102),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ])
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PreferredSizeWidget appBar() {
  //   return AppBar(
  //     title: const Text('Email Us'),
  //     centerTitle: true,
  //     leading: IconButton(
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => Settings()),
  //           );
  //         },
  //         icon: Icon(Icons.arrow_back)),
  //   );
  // }
}
