import 'package:flutter/material.dart';
import 'package:graduation_project/Pages/EMRPage/AllergyPage/AllergyCard.dart';
import 'package:graduation_project/Pages/EMRPage/LoadingCard.dart';
import 'package:graduation_project/Pages/EMRPage/AllergyPage/getCustomAllergyModalBottomSheet.dart';
import 'package:graduation_project/api/getEMRAllergy.dart';
import 'package:graduation_project/model/Allergy.dart';
import 'package:graduation_project/model/Patient.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../SchedulePage/CustomLoadingScheduleCard.dart';

class AllergyListView extends StatelessWidget {
  AllergyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Allergy>>(
        future: getEMRAllergy(),
        builder: (BuildContext context, AsyncSnapshot<List<Allergy>> snapshot) {
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
                      onTap: () => getCustomAllergyModalBottomSheet(context),
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
                  child: AllergyCard(allergy: snapshot.data![index]),
                );
              },
            ),
          );
        });
  }
}
