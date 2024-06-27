import 'package:flutter/material.dart';
import 'package:graduation_project/model/File.dart';
import './FileCard.dart';

void getCustomFileModalBottomSheet(BuildContext context, List<File> files) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Container(
            padding: EdgeInsets.all(10),
            child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.9,
                expand: false,
                builder: (context, scrollController) => SafeArea(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: files.length,
                          itemBuilder: (context, index) =>
                              FileCard(file: files[index])),
                    )),
          ));
}
