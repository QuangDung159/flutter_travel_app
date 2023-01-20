import 'package:get/get.dart';

class GetXController extends GetxController {
  RxInt countRoom = 1.obs;
  RxInt countGuest = 1.obs;
  RxInt checkoutStepActive = 1.obs;
  RxInt paymentMethodSelected = 1.obs;
  RxList<DateTime> datetimeRangeSelected =
      [DateTime(2022, 1, 1, 0, 0, 0), DateTime(2022, 1, 3, 0, 0, 0)].obs;

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

  void updatePaymentMethodSelected(int paymentMethodId) {
    paymentMethodSelected.value = paymentMethodId;
  }

  void updateDatetimeRangeSelected(List<DateTime> datetimeRange) {
    datetimeRangeSelected.value = datetimeRange;
  }
}
