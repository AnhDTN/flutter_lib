import 'package:flutter/material.dart';
import 'package:flutter_lib/extensions/ui.dart';
import 'package:flutter_lib/resources/colors.dart';
import 'package:flutter_lib/resources/route.dart';
import 'package:flutter_lib/resources/text_style.dart';
import 'package:flutter_lib/views/page/home_page.dart';
import 'package:flutter_lib/views/router/routing.dart';
import 'package:flutter_lib/views/widgets/button_confirm_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _onLogin() {
    Routing.navigateAnim(context, const HomePage(),
        routeName: RouteName.homePage, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: maxWidth(context),
        height: maxHeight(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border, width: 1),
                    borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyles.body2Gray(context),
                          border: InputBorder.none),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyles.body2Gray(context),
                          border: InputBorder.none),
                    )
                  ],
                ),
              ),
              ButtonView(
                text: "Login",
                padding: const EdgeInsets.all(16),
                onTap: _onLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
