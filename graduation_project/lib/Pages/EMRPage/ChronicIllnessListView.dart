import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/EMRPage/ChronicIllnessCard.dart';
import 'package:graduation_project/Pages/EMRPage/LoadingCard.dart';
import 'package:graduation_project/api/getEMRChronicIllness.dart';
import 'package:graduation_project/model/ChronicIllness.dart';

class ChronicIllnessListView extends StatelessWidget {
  ChronicIllnessListView({super.key});
  final List<LoadingCard> _loadingCardList = [
    LoadingCard(),
    LoadingCard(),
    LoadingCard(),
    LoadingCard()
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChronicIllness>>(
        future: getEMRChronicIllness(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ChronicIllness>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _loadingCardList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: _loadingCardList[index],
                  );
                },
              ),
            );
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Text("error");
          }
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:
                      ChronicIllnessCard(chronicIllness: snapshot.data![index]),
                );
              },
            ),
          );
        });
  }
}
