import 'package:flutter/material.dart';
import 'package:graduation_project/class/AppTheme.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Enter a search term',
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppTheme.customBlue,
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black),
                    //     borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                              margin: EdgeInsets.only(right: 25),
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  // border: Border.all(
                                  //   color: Colors.blue,
                                  // ),
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.circle,
                                  ),
                              child: Image(
                                  image:
                                      AssetImage('assets/img/Logo/Cura.png'))),
                        ),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              Text("Dr. Moustafa Ashraf"),
                              Text("neurology"),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

/*
  Flexible(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.only(right: 25),
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              // border: Border.all(
                              //   color: Colors.blue,
                              // ),
                              borderRadius: BorderRadius.circular(10)
                              // shape: BoxShape.circle,
                              ),
                          child: Image(
                              image: AssetImage('assets/img/Logo/Cura.png'))),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text("Dr. Moustafa Ashraf"),
                          Text("neurology"),
                        ],
                      ),
                    )

*/