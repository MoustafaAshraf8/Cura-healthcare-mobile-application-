import 'package:cura_for_doctor/Pages/EMRPage/CustomLoadingScheduleCard.dart';
import 'package:flutter/material.dart';
import 'package:cura_for_doctor/Pages/EMRPage/AllergyPage/AllergyCard.dart';
import 'package:cura_for_doctor/Pages/EMRPage/LoadingCard.dart';
import 'package:cura_for_doctor/Pages/EMRPage/AllergyPage/getCustomAllergyModalBottomSheet.dart';
import 'package:cura_for_doctor/api/getEMRAllergy.dart';
import 'package:cura_for_doctor/model/Allergy.dart';
import 'package:cura_for_doctor/model/Patient.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AllergyListView extends StatelessWidget {
  final int patient_id;
  AllergyListView({required this.patient_id, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Allergy>>(
        future: getEMRAllergy(patient_id: this.patient_id),
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
                      onTap: () =>
                          getCustomAllergyModalBottomSheet(context, patient_id),
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
