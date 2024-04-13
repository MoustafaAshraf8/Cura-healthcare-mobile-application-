import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
