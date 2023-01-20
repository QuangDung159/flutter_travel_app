import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/checkout_process_widget.dart';
import 'package:flutter_travel_app/representation/widgets/icon_background_widget.dart';

class CheckoutConfirmScreen extends StatefulWidget {
  const CheckoutConfirmScreen({super.key});

  static String routerName = '/checkout_confirm_screen';

  @override
  State<CheckoutConfirmScreen> createState() => _CheckoutConfirmScreenState();
}

class _CheckoutConfirmScreenState extends State<CheckoutConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    RoomModel room = ModalRoute.of(context)?.settings.arguments as RoomModel;

    return AppBarContainer(
      implementLeading: true,
      titleString: 'Checkout',
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        renderRoomInfo(room),
                        SizedBox(
                          height: 15,
                        ),
                        Image.asset(AssetHelper.imageDashLine),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconBackgroundWidget(
                                  child: Image.asset(
                                    AssetHelper.iconCheckin,
                                    width: 14,
                                    height: 20,
                                  ),
                                  backgroundColor:
                                      Color(0xffF77777).withOpacity(0.2),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check-in',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff636363),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Fri, 13 Feb',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconBackgroundWidget(
                                  child: Image.asset(
                                    AssetHelper.iconCheckout,
                                    width: 14,
                                    height: 20,
                                  ),
                                  backgroundColor:
                                      Color(0xf3EC8BC).withOpacity(0.2),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check-out',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff636363),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Sat, 14 Feb',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        renderBookingInfoRow(
                            '1 Night', '\$${room.price}', false),
                        SizedBox(
                          height: 10,
                        ),
                        renderBookingInfoRow('Taxes and Fees', 'Free', false),
                        SizedBox(
                          height: 15,
                        ),
                        Image.asset(AssetHelper.imageDashLine),
                        SizedBox(
                          height: 15,
                        ),
                        renderBookingInfoRow('Total', '\$${room.price}', true),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconBackgroundWidget(
                              child: Image.asset(
                                AssetHelper.iconMastercard,
                                width: 28.44,
                                height: 17.7,
                              ),
                              backgroundColor:
                                  Color(0xffFE9C5E).withOpacity(0.2),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Credit / Debit Card',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff636363),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Master Card',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          'Change',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6155CC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonWidget(
                    title: 'Pay Now',
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      MainScreen.routerName,
                      (Route<dynamic> route) => false,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          CheckoutProcessWidget(
            stepActive: 3,
          )
        ],
      ),
    );
  }

  Widget renderBookingInfoRow(String title, String value, bool isBold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isBold ? 14 : 12,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 14 : 12,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
          ),
        )
      ],
    );
  }

  Widget renderRoomInfo(RoomModel roomModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomModel.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${roomModel.isFreeCancellation ? 'Free Cancellation' : 'Paid cancellation'}',
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image.asset(
                  AssetHelper.iconBed,
                  color: Color(0xffFE9C5E),
                  width: 20,
                  height: 16,
                ),
                if (roomModel.subTitle != null && roomModel.subTitle != '')
                  Row(
                    children: [
                      SizedBox(
                        width: 12.5,
                      ),
                      Text(
                        roomModel.subTitle ?? '',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
              ],
            ),
          ],
        ),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            roomModel.image,
            width: 60,
          ),
        ),
      ],
    );
  }
}
