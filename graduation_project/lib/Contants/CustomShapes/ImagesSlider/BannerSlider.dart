import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Components/HomeController/HomeController.dart';
import 'package:graduation_project/Contants/CustomShapes/Containers/CircularContainer.dart';
import 'package:graduation_project/Contants/CustomShapes/Images/Roundedimages.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        ///Images Slider
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => Roundedimage(imageUrl: url)).toList(),
        ),

        ///Space Between Images & Buttons
        const SizedBox(height: 16.0),

        ///Buttons To Slide Images
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? const Color.fromARGB(255, 8, 55, 102)
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
