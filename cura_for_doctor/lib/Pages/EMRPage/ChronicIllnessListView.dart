import 'package:cura_for_doctor/Pages/EMRPage/ChronicIllnessCard.dart';
import 'package:cura_for_doctor/Pages/EMRPage/CustomLoadingScheduleCard.dart';
import 'package:cura_for_doctor/Pages/EMRPage/LoadingCard.dart';
import 'package:cura_for_doctor/api/getEMRChronicIllness.dart';
import 'package:cura_for_doctor/model/ChronicIllness.dart';
import 'package:flutter/material.dart';

class ChronicIllnessListView extends StatelessWidget {
  final int patient_id;
  ChronicIllnessListView({required this.patient_id, super.key});
  final List<LoadingCard> _loadingCardList = [
    LoadingCard(),
    LoadingCard(),
    LoadingCard(),
    LoadingCard()
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChronicIllness>>(
        future: getEMRChronicIllness(patient_id: patient_id),
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
