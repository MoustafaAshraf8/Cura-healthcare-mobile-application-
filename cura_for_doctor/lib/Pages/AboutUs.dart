import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 55, 102),
        appBar: const TAppBar(
          showBackArrow: true,
          whiteBackArrow: true,
          title: Text("About Us",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: [
            Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 27,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    height: 350,
                    width: 350,
                    child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/img/Logo/Cura.png"))),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      right: 90,
                      child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 195, 106),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "CURA is the leading digital healthcare booking platform and practice management software in MENA.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      right: 30,
                      bottom: 140,
                      child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 8, 55, 102),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "We are pioneering the shift to automated physician, clinic, and hospital bookings making healthcare easily accessible in the region.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
