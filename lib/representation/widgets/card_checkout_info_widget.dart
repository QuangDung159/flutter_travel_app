import 'package:flutter/material.dart';

class CardCheckoutInfoWidget extends StatelessWidget {
  const CardCheckoutInfoWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.isShowCheckbox = false,
    this.isChecked = false,
    this.isShowButtonAdd = false,
    this.onCheck,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Widget icon;
  final bool? isShowCheckbox;
  final bool? isChecked;
  final bool? isShowButtonAdd;
  final Function()? onCheck;

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
                  icon,
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (isShowCheckbox!)
                GestureDetector(
                  onTap: onCheck,
                  child: Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffE0DDF5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: isChecked!
                        ? Icon(
                            Icons.check,
                            size: 15,
                          )
                        : null,
                  ),
                ),
            ],
          ),
          if (isShowButtonAdd!) renderButtonAdd()
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
                subTitle,
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
