import 'package:get/get.dart';

class GetXController extends GetxController {
  RxInt countRoom = 1.obs;
  RxInt countGuest = 1.obs;
  RxInt checkoutStepActive = 1.obs;

  void increaseRoom() {
    countRoom++;
  }

  void increaseGuest() {
    countGuest++;
  }

  void decreaseRoom() {
    if (countRoom > 1) {
      countRoom--;
    }
  }

  void decreaseGuest() {
    if (countGuest > 1) {
      countGuest--;
    }
  }

  void updateCheckoutStepActive(int step) {
    checkoutStepActive.value = step;
  }
}
