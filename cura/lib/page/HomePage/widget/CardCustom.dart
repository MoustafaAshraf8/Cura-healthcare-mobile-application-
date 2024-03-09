import 'package:cura/model/AppTheme.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("card tapped");
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        // width: MediaQuery.of(context).size.width * 0.5,
        // height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(20.0) //                 <--- border radius here
              ),
          // border: Border.all(color: Colors.black),
          color: Colors.black.withOpacity(0.1),
        ),
        child: Center(
            child: Row(
          children: [
            Icon(Icons.person, size: 40),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Heading text",
                      style: TextStyle(fontSize: AppTheme.text_fontSize_1),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "secondary text for secondary description",
                      style: TextStyle(fontSize: AppTheme.text_fontSize_0),
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
