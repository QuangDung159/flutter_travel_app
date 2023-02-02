import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routerName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = false;

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
                  renderLoginTextfield(true, 'Password', 'Password')
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
