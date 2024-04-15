import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/SearchBar/Searchbar.dart';
import 'package:graduation_project/Pages/DoctorProfile.dart';

//Doctor class to be added to the GridView.builder
class Doctor {
  String img;
  String name;
  String speciality;
  String rate;
  Doctor(
      {required this.img,
      required this.name,
      required this.speciality,
      required this.rate});
}

class DoctorsList extends StatefulWidget {
  final String speciality;
  DoctorsList({super.key, required this.speciality});

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  //The List "items" of type Doctor to be added to the Gridview.builder --
  List<Doctor> items = [
    Doctor(
        img: "assets/img/Logo/Cura.png",
        name: "Adham Mohamed",
        speciality: "Therapist",
        rate: "4.9"),
    Doctor(
        img: "assets/img/Logo/Cura.png",
        name: "Mostafa Ashraf",
        speciality: "Therapist",
        rate: "4.9"),
    Doctor(
        img: "assets/img/Logo/Cura.png",
        name: "Mostafa Shousha",
        speciality: "Therapist",
        rate: "4.9"),
    Doctor(
        img: "assets/img/Logo/Cura.png",
        name: "Yousef Shalaby",
        speciality: "Therapist",
        rate: "4.9"),
    Doctor(
        img: "assets/img/Logo/Cura.png",
        name: "Yousef Wahba",
        speciality: "Therapist",
        rate: "4.9"),
    Doctor(
        img: "assets/img/Logo/Cura.png",
        name: "Musaad Tahoun",
        speciality: "Therapist",
        rate: "4.9"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header --Page Header-- (Blue Part) Using "Secondary Header Countainer"
            const SecondaryHeaderContainer(
                child: Column(
              children: [
                //Header AppBar
                SizedBox(
                  height: 5,
                ),
                TAppBar(
                  showBackArrow: true,
                  title: Text(
                    "Available Doctors",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  actions: [
                    Icon(
                      Icons.person_pin_rounded,
                      color: Colors.white,
                      size: 27,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                //SearchBar
                Searchbar(),
              ],
            )),

            ///Body --Page Body-- (White Part)
            const Text(
              "Most Popular Doctors",
              style: TextStyle(
                  color: Color.fromARGB(255, 8, 55, 102),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DoctorProfile(), // 7ot route el page di hna
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ///Circle Avatar "Image"
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(items[index].img),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Dr. ${items[index].name}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              items[index].speciality,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 195, 106),
                                ),
                                Text(
                                  items[index].rate,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
