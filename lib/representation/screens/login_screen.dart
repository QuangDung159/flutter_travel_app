import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/core/services/google_services.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/login_method_button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/login_methods_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routerName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = false;
  bool isCheckedRemember = false;

  Future<void> handleGoogleSignIn() async {
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
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Login',
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: containerPaddingWithAppBar + 25,
                  ),
                  renderLoginTextfield(false, 'Email', 'Email'),
                  SizedBox(
                    height: 20,
                  ),
                  renderLoginTextfield(true, 'Password', 'Password'),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () => setState(() {
                  //             isCheckedRemember = !isCheckedRemember;
                  //           }),
                  //           child: Container(
                  //             width: 24,
                  //             height: 24,
                  //             decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //             child: isCheckedRemember
                  //                 ? Icon(
                  //                     Icons.check,
                  //                     size: 18,
                  //                   )
                  //                 : null,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text(
                  //           'Remember me',
                  //         )
                  //       ],
                  //     ),
                  //     Text(
                  //       'Forgot password?',
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(title: 'Log In'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffBDBDBD),
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Text(
                            'or log in with',
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffBDBDBD),
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LoginMethodsWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLoginTextfield(
    bool isPassword,
    String label,
    String? placeholder,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff636363),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            obscureText: isPassword ? isShowPassword : isPassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? GestureDetector(
                      child: Icon(
                        isShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: BoxConstraints(maxHeight: 12),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: placeholder,
            ),
          ),
        ],
      ),
    );
  }
}
