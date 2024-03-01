import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/CircularContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/CurvedEdges/CurvedEdgesWidget.dart';

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
