import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graduation_project/Contants/CustomShapes/AppBar/AppBar.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 55, 102),
        appBar: TAppBar(
          showBackArrow: true,
          whiteBackArrow: true,
          title: Text("Policy & Agreements",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: [
            Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 27,
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                          fontSize: 16),
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