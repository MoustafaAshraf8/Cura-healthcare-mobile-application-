import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 55, 102),
        body: Center(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,

                    /// Required, The loading type of the widget
                    colors: const [Color.fromARGB(255, 255, 195, 106)],

                    /// Optional, The color collections
                    strokeWidth: 2,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: const Color.fromARGB(255, 8, 55, 102),

                    /// Optional, Background of the widget
                    pathBackgroundColor: const Color.fromARGB(255, 8, 55, 102)

                    /// Optional, the stroke backgroundColor
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
