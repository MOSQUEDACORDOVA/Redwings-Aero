import 'package:get/get.dart';

class TabBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}