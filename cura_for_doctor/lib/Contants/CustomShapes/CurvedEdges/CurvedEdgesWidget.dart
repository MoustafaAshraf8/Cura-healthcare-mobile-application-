import 'package:cura_for_doctor/Contants/CustomShapes/CurvedEdges/CurvedEdges.dart';
import 'package:flutter/material.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
