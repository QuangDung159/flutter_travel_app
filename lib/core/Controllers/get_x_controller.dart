import 'package:flutter_travel_app/data/models/payment_method_model.dart';
import 'package:get/get.dart';

class GetXController extends GetxController {
  RxInt countRoom = 1.obs;
  RxInt countGuest = 1.obs;
  RxInt checkoutStepActive = 1.obs;
  RxList<DateTime> datetimeRangeSelected = [
    new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
        .add(Duration(days: 1)),
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
        .add(Duration(days: 2))
  ].obs;
  final paymentMethodSelected = Rxn<PaymentMethodModel>();

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

  void updateDatetimeRangeSelected(List<DateTime> datetimeRange) {
    datetimeRangeSelected.value = datetimeRange;
  }

  void updatePaymentMethodSelected(PaymentMethodModel paymentMethod) {
    paymentMethodSelected.value = paymentMethod;
  }
}
