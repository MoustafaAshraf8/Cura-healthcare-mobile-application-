import 'package:cura_for_doctor/Contants/CustomShapes/Containers/CircularContainer.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/CurvedEdges/CurvedEdgesWidget.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: const Color.fromARGB(255, 8, 55, 102),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1)),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1)),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
