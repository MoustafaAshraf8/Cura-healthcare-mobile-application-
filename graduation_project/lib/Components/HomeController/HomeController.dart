import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instaance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
