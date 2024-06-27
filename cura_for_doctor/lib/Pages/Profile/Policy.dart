import 'package:cura_for_doctor/Contants/CustomShapes/AppBar/AppBar.dart';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class policy extends StatefulWidget {
  const policy({super.key});

  @override
  State<policy> createState() => _PolicyState();
}

class _PolicyState extends State<policy> {
  String policyText = '';
  @override
  void initState() {
    super.initState();
    loadPolicyText(); // Call method to load policy text when screen initializes
  }

  void loadPolicyText() async {
    String policy = await rootBundle.loadString('assets/policy.txt');
    setState(() {
      policyText = policy; // Update state variable with policy text
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 55, 102),
        appBar: TAppBar(
          showBackArrow: true,
          whiteBackArrow: true,
          title: Text("Policy & Agreements",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: [
            Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 24.sp,
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: /*<Widget>[
                const Text(
                  '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),*/
                  [
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      policyText,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 195, 106),
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
