import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  Function updateView;
  CustomNavigationBar({super.key, required this.updateView});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: const Color.fromARGB(255, 8, 55, 102),
      animationDuration: const Duration(milliseconds: 300),
      onTap: (value) {
        print("page --> ${value}");
        updateView(value);
      },
      items: const [
        Icon(
          Icons.home_rounded,
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
        Icon(
          Icons.person,
          color: Color.fromARGB(255, 255, 195, 106),
        ),
      ],
    );
  }
}
