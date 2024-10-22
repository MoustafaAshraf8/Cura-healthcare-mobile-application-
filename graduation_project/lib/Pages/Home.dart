import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/PrimaryHeaderContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/ImagesSlider/BannerSlider.dart';

//Category class to be added to the slider(Listview.builder)
class Category {
  String imgPath;
  String title;

  Category({required this.imgPath, required this.title});
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//The List "items" of type Category to be added to the Listview.builder --
  List<Category> items = [
    Category(imgPath: "assets/img/Categories/1.jpg", title: "Clinic Visit"),
    Category(imgPath: "assets/img/Categories/2.jpg", title: "Home Visit"),
    Category(imgPath: "assets/img/Categories/3.jpg", title: "EMR"),
    Category(imgPath: "assets/img/Categories/4.jpg", title: "ChatBot"),
    Category(imgPath: "assets/img/Categories/5.jpg", title: "Offers"),
    Category(imgPath: "assets/img/Categories/6.jpg", title: "About Us"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                    const TAppBar(
                      title: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Back!",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white)),
                          Text("Adham Mohamed",
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
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Container(
                          width: 400,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: Color.fromARGB(255, 8, 55, 102),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search for Appointment ..",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 8, 55, 102),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                                  onTap: () {},
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
        ),

        ///Navigation Bar --Page Footer--
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 8, 55, 102),
          animationDuration: const Duration(milliseconds: 300),
          onTap: (value) {},
          items: const [
            Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 255, 195, 106),
            ),
            Icon(
              Icons.person,
              color: Color.fromARGB(255, 255, 195, 106),
            ),
            Icon(
              Icons.history,
              color: Color.fromARGB(255, 255, 195, 106),
            ),
            Icon(
              Icons.message_rounded,
              color: Color.fromARGB(255, 255, 195, 106),
            ),
            Icon(
              Icons.payment_rounded,
              color: Color.fromARGB(255, 255, 195, 106),
            ),
          ],
        ),
      ),
    );
  }
}
