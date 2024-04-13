import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/SearchBar/SearchBar.dart';

//MedicalSpeciality class to be added to the GridView.builder
class MedicalSpeciality {
  final String img;
  final String text;
  MedicalSpeciality({required this.img, required this.text});
}

class Speciality extends StatefulWidget {
  const Speciality({super.key});

  @override
  State<Speciality> createState() => _SpecialityState();
}

class _SpecialityState extends State<Speciality> {
  //The List "items" of type MedicalSpeciality to be added to the Gridview.builder --
  List<MedicalSpeciality> items = [
    MedicalSpeciality(
        img: "assets/img/Specialities/Dermatology.jpg", text: "Dermatology"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Dentistry.jpg", text: "Dentistry"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Neurology.jpg", text: "Neurology"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Orthopedics.jpg", text: "Orthopedics"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Pediatrics.jpg", text: "Pediatrics"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Psychiatry.jpg", text: "Psychiatry"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Cardiology.jpg", text: "Cardiology"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Internal Medicine.jpg", text: "Internal"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Gynaecology and Infertility.jpg",
        text: "Gynaecology"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Throat.jpg", text: "Throat"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Diabetes and Endocrinology.jpg",
        text: "Diabetes"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Chest and Respiratory.jpg",
        text: "Respiratory"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Audiology.jpg", text: "Audiology"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Andrology and Male Infertility.jpg",
        text: "Andrology"),
    MedicalSpeciality(
        img: "assets/img/Specialities/Allergy and Immunology.jpg",
        text: "Allergy"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
            const SecondaryHeaderContainer(
                child: Column(
              children: [
                //Header AppBar
                SizedBox(
                  height: 5,
                ),
                TAppBar(
                  showBackArrow: true,
                  title: Text("Speciality",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  actions: [
                    Icon(
                      Icons.workspace_premium,
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
              "Most Popular Specialities",
              style: TextStyle(
                  color: Color.fromARGB(255, 8, 55, 102),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              ///Circle Container
                              Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: Colors.white,
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image(
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      image: AssetImage(items[index].img),
                                    ),
                                  )),
                              const SizedBox(
                                height: 8,
                              ),

                              ///Text Under Circles
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Center(
                                  child: Text(
                                    items[index].text,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 8, 55, 102),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
