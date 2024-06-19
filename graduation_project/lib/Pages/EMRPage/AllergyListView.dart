import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/EMRPage/AllergyCard.dart';
import 'package:graduation_project/Pages/EMRPage/LoadingCard.dart';
import 'package:graduation_project/api/getEMRAllergy.dart';
import 'package:graduation_project/model/Allergy.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AllergyListView extends StatelessWidget {
  AllergyListView({super.key});

  final List<LoadingCard> _loadingCardList = [
    LoadingCard(),
    LoadingCard(),
    LoadingCard(),
    LoadingCard()
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Allergy>>(
        future: getEMRAllergy(),
        builder: (BuildContext context, AsyncSnapshot<List<Allergy>> snapshot) {
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
                  child: AllergyCard(allergy: snapshot.data![index]),
                );
              },
            ),
          );
        });
  }
}
