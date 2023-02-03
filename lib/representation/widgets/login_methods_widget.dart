import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/core/services/google_services.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/representation/widgets/login_method_button_widget.dart';

class LoginMethodsWidget extends StatelessWidget {
  const LoginMethodsWidget({super.key});

  Future<void> handleGoogleSignIn(context) async {
    try {
      final res = await GoogleServices.login();
      if (res != null) {
        Navigator.of(context).pushNamed(MainScreen.routerName);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginMethodButtonWidget(
          icon: ImageHelper.loadFromAsset(
            AssetHelper.iconGoogle,
            height: 22,
          ),
          title: Text(
            'Google',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          onTap: () => handleGoogleSignIn(context),
        ),
        LoginMethodButtonWidget(
          icon: Image.asset(
            AssetHelper.iconFacebook,
            width: 11,
          ),
          title: Text(
            'Facebook',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff3C5A9A),
          onTap: () => null,
        )
      ],
    );
  }
}
