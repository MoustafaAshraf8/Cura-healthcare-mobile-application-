import 'package:flutter/material.dart';
import 'package:cura_for_doctor/Pages/EMRPage/CustomWebViewPage.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../model/File.dart';

class FileCard extends StatelessWidget {
  final File file;
  const FileCard({required this.file, super.key});

  // _launchURL() async {
  //   const url = 'https://flutter.dev';
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     print("xxxxxxxxxxxxx");
  //   }
  // }

  // void openCustomWebView(Contex context){
  //    ),
  // );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomWebViewPage(
                  file: file,
                )),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(5),
                child: Icon(Icons.file_copy, size: 40)),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                file.id,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
