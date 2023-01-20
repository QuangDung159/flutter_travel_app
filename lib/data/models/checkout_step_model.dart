class CheckoutStepModel {
  final int step;
  final String stepName;
  final bool isCheck;
  final bool isEnd;

  CheckoutStepModel({
    required this.step,
    required this.stepName,
    required this.isCheck,
    required this.isEnd,
  });
}
