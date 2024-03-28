import 'package:Mot3lqat/main.dart';
import 'package:Mot3lqat/src/pages/page4/pages/ID_Page.dart';
import 'package:Mot3lqat/src/pages/page4/pages/add_ID_page.dart';
import 'package:flutter/material.dart';
import 'package:Mot3lqat/src/pages/page1/sign_up.dart';
import 'package:Mot3lqat/src/pages/page2/log_in.dart';
import 'package:Mot3lqat/src/pages/page3/forget_password.dart';
import 'route_names.dart';

class RoutesPath {
  static final routes = <String, WidgetBuilder>{
    Routes.signUpPage: (context) => const SignUp(), //defaultpage
    Routes.logInPage: (context) => const LogIn(),
    Routes.forgotPasswordPage: (context) => const ForgetPassword(),
    Routes.HomePage: (context) => const HomePage(),
    Routes.IdPage: (context) => const IdPage(),


  };
}
