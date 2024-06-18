// import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
// import 'package:cura_for_doctor/Contants/CustomShapes/Containers/SecondaryHeaderContainer.dart';
// import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/Event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class EventViewing extends StatelessWidget {
//   final Event event;
//   const EventViewing({super.key, required this.event});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: CloseButton(),
//           actions: buildViewingActions(context, event),
//         ),
//         body: ListView(
//           padding: EdgeInsets.all(28.sp),
//           children: [
//             buildDateTime(event),
//             SizedBox(
//               height: 30.sp,
//             ),
//             Text(
//               event.title,
//               style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 22.sp,
//             ),
//             Text(
//               event.description,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );

//     Widget buildDateTime(Event event) {
//       return Column(
//         children: [
//          Text(event.from as String),
//          Text(event.to as String)
         
//         ],
//       );
//     }
//   }
// }
