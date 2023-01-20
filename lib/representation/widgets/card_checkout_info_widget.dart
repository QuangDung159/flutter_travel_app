import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/data/models/payment_method_model.dart';
import 'package:get/get.dart';

class CardCheckoutInfoWidget extends StatefulWidget {
  const CardCheckoutInfoWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.addButtonTitle,
    this.isShowCheckbox = false,
    this.isChecked = false,
    this.onCheck,
    this.paymentMethod,
  }) : super(key: key);

  final String title;
  final String? addButtonTitle;
  final Widget icon;
  final bool? isShowCheckbox;
  final bool? isChecked;
  final Function()? onCheck;
  final PaymentMethodModel? paymentMethod;

  @override
  State<CardCheckoutInfoWidget> createState() => _CardCheckoutInfoWidgetState();
}

class _CardCheckoutInfoWidgetState extends State<CardCheckoutInfoWidget> {
  GetXController getX = Get.find<GetXController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  widget.icon,
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (widget.isShowCheckbox!)
                Obx(
                  () => GestureDetector(
                    onTap: widget.onCheck,
                    child: Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffE0DDF5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: getX.paymentMethodSelected == 1
                          ? Icon(
                              Icons.check,
                              size: 15,
                            )
                          : null,
                    ),
                  ),
                )
            ],
          ),
          if (widget.addButtonTitle != null && widget.addButtonTitle! != '')
            renderButtonAdd()
        ],
      ),
    );
  }

  Column renderButtonAdd() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xffE0DDF5).withOpacity(0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.addButtonTitle ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6155CC),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
