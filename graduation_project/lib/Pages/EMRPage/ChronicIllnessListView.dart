import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/EMRPage/ChronicIllnessCard.dart';
import 'package:graduation_project/Pages/EMRPage/LoadingCard.dart';
import 'package:graduation_project/Pages/SchedulePage/CustomLoadingScheduleCard.dart';
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomLoadingScheduleCard(),
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
              itemCount: snapshot.data!.length + 1,
              itemBuilder: (context, index) {
                if (index == snapshot.data!.length) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF11519b),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                }
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
