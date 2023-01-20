class PaymentMethodModel {
  final String title;
  final String? addButtonTitle;
  final int id;
  final String iconType;

  PaymentMethodModel({
    required this.title,
    this.addButtonTitle,
    required this.id,
    required this.iconType,
  });
}
