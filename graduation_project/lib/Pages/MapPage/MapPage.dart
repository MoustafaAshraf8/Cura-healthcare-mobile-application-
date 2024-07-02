import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/class/AppTheme.dart';

class Mappage extends StatefulWidget {
  const Mappage({super.key});

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  var markerSet = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.customBlue,
        centerTitle: true,
        title: Text(
          "Google Maps",
          style: TextStyle(color: AppTheme.customGold),
        ),
      ),
      backgroundColor: AppTheme.customBlue,
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 10),
              // onMapCreated: (GoogleMapController googleMapController){
              //   setState(() {
              //     markerSet.add(Marker(markerId: MarkerId(value)));
              //   });
              // },
            )),
      ),
    );
  }
}
