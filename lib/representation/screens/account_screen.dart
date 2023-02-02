import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/getx_google_info_controller.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';
import 'package:flutter_travel_app/core/services/google_services.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  static String routerName = '/account_screen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  GetxGoogleInfoController googleInfo = Get.find<GetxGoogleInfoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBarContainer(
        titleString:
            'Hi ${googleInfo.displayName.value != '' ? googleInfo.displayName.value : 'Buddy'}',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: containerPaddingWithAppBar + 25,
              ),
              if (googleInfo.photoUrl.value != '')
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        googleInfo.photoUrl.value,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              renderAccountInfo(
                'Name',
                googleInfo.displayName.value != ''
                    ? googleInfo.displayName.value
                    : 'Buddy',
              ),
              SizedBox(
                height: 20,
              ),
              renderAccountInfo(
                'Email',
                googleInfo.email.value != '' ? googleInfo.email.value : 'N/a',
              ),
              SizedBox(
                height: 20,
              ),
              renderAccountButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget renderAccountButton(BuildContext context) {
    bool isLogged = googleInfo.displayName.value != '';
    return ButtonWidget(
      title: isLogged ? 'Log out' : 'Log in',
      onTap: () {
        if (isLogged) {
          CommonHelper.showMyDialog(
            context: context,
            actions: [
              TextButton(
                child: Text('Log out'),
                onPressed: () {
                  GoogleServices.logout();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            title: Text('Are you sure want to log out?'),
            content: null,
            barrierDismissible: false,
          );
        } else {
          GoogleServices.login();
        }
      },
    );
  }

  Widget renderAccountInfo(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
