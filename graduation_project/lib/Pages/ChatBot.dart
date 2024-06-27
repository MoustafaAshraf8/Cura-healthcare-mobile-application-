import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graduation_project/Contants/ChatBot/AssetManager.dart';
import 'package:graduation_project/Contants/ChatBot/Chat.dart';
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
import 'package:graduation_project/Pages/ChatWidget.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<chatScreen> {
  final bool typing = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void msgSubmit(String text) {
    if (text.isEmpty) return;

    setState(() {
      chatMessages.add({"msg": text, "chatIndex": "0"});
      textEditingController.clear();
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     title: const Text(
        //       'Cura AI Assistance',
        //       style:
        //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     backgroundColor: Color.fromARGB(255, 8, 55, 102),
        //     // centerTitle: true,
        //     leading: Image.asset(AssetsManager.curaPath),
        //     actions: [
        //       IconButton(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.close,
        //             color: Colors.white,
        //           )),
        //     ]),
        body: Column(children: [
          ///Header --Page Header-- (Blue Part) --> Using Secondary Header Container "Not the home page"
          const SecondaryHeaderContainer(
              child: Column(
            children: [
              //Header AppBar
              SizedBox(
                height: 5,
              ),
              TAppBar(
                showBackArrow: true,
                title: Text("Cura AI Assistance",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                actions: [
                  Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: 27,
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          )),

          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: chatMessages.length,
                      itemBuilder: (context, index) {
                        return chatWidget(
                            msg: chatMessages[index]["msg"].toString(),
                            chatIndex: int.parse(
                                chatMessages[index]["chatIndex"].toString()));
                      },
                    ),
                  ),
                ),
                if (typing) ...[
                  const SpinKitThreeBounce(
                    color: Colors.black,
                  )
                ],
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              textAlign: TextAlign.left,
                              onSubmitted: (value) {},
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Message Cura AI Assistance',
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                msgSubmit(textEditingController.text);
                              },
                              icon: const Icon(Icons.send))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
