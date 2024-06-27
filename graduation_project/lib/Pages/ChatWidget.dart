// import 'dart:ui_web';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/Contants/ChatBot/AssetManager.dart';

class chatWidget extends StatelessWidget {
  const chatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userPath
                      : AssetsManager.curaPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(msg, style: const TextStyle(fontSize: 18)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
