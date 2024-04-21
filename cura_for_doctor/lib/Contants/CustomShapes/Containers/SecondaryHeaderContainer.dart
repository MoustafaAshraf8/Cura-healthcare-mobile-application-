import 'package:cura_for_doctor/Contants/CustomShapes/Containers/CircularContainer.dart';
import 'package:cura_for_doctor/Contants/CustomShapes/CurvedEdges/CurvedEdgesWidget.dart';
import 'package:flutter/material.dart';

class SecondaryHeaderContainer extends StatelessWidget {
  const SecondaryHeaderContainer({
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
          height: MediaQuery.of(context).size.height * 0.2,
          child: Stack(
            children: [
              Positioned(
                top: -250,
                right: -250,
                child: CircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1)),
              ),
              Positioned(
                top: 25,
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
