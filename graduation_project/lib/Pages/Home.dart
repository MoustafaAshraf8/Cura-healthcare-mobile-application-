import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/PrimaryHeaderContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/CustomSearchBar/CustomSearchBar.dart';
import 'package:graduation_project/Contants/CustomShapes/ImagesSlider/BannerSlider.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Category class to be added to the slider(Listview.builder)
class Category {
  String imgPath;
  String title;
  String route;

  Category({required this.imgPath, required this.title, required this.route});
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool patientInitialized = false;
  late Patient patient;
  Future<Patient> readPatientData() async {
    final prefs = await SharedPreferences.getInstance();
    var patientDataString = await prefs.getString('patient');
    var decoded = json.decode((patientDataString as String));
    patient = Patient.fromJson(decoded);
    return patient;
  }

  var search = true;

  void revertSearch() {
    setState(() {
      search = !search;
    });
  }

  @override
  void initState() {
    super.initState();
    readPatientData().then((patientObject) {
      setState(() {
        patient = patientObject;
        patientInitialized = true;
      });
    });
  }

//The List "items" of type Category to be added to the Listview.builder --
  List<Category> items = [
    Category(
        imgPath: "assets/img/Categories/1.jpg",
        title: "Clinic Visit",
        route: "/Speciality"),
    Category(
        imgPath: "assets/img/Categories/2.jpg",
        title: "Home Visit",
        route: "/Speciality"),
    Category(
        imgPath: "assets/img/Categories/3.jpg", title: "EMR", route: "/Home"),
    Category(
        imgPath: "assets/img/Categories/4.jpg",
        title: "ChatBot",
        route: "/ChatBot"),
    Category(
        imgPath: "assets/img/Categories/5.jpg",
        title: "Offers",
        route: "/Home"),
    Category(
        imgPath: "assets/img/Categories/6.jpg",
        title: "About Us",
        route: "/AboutUs"),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ///Header --Page Header-- (Blue Part)
          PrimaryHeaderContainer(
            child: Column(
              children: [
                //Header AppBar
                const SizedBox(
                  height: 5,
                ),
                TAppBar(
                  title: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back!",
                          style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.white)),
                      Text(
                          (!patientInitialized)
                              ? "Adham Mohamed"
                              : "${patient.FirstName} ${patient.LastName}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  actions: [
                    Icon(
                      Icons.notification_add,
                      color: Colors.white,
                      size: 27,
                    )
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                //SearchBar
                CustomSearchBar(revertSearch: revertSearch),
                const SizedBox(
                  height: 32.0,
                ),
                //Categories Slider
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    children: [
                      // -Heading-
                      const Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      // -Slider-
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, items[index].route);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Column(
                                  children: [
                                    //Circular Icon
                                    Expanded(
                                      child: Container(
                                        width: 90,
                                        height: 40,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(200)),
                                        child: Center(
                                            child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          child: Image(
                                            image: AssetImage(
                                                items[index].imgPath),
                                            fit: BoxFit.cover,
                                            //color: Colors.black,
                                          ),
                                        )),
                                      ),
                                    ),
                                    //Text Under The Circular Icon
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Center(
                                        child: Text(
                                          items[index].title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          ///Body --Page Body-- (White Part)
          const Padding(
            padding: EdgeInsets.all(24.0),

            ///ImageBaneerSlider
            child: BannerSlider(banners: [
              "assets/img/Banners/Banner1.jpg",
              "assets/img/Banners/Banner2.jpg",
              "assets/img/Banners/Banner3.jpg"
            ]),
          )
        ],
      ),
    );
  }
}
