import 'package:flutter/material.dart';
import 'package:graduation_project/Contants/CustomShapes/CurvedEdges/CurvedEdges.dart';

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
