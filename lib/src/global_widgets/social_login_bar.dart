import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Mot3lqat/src/config/themes/app_styles.dart';
import 'package:Mot3lqat/src/global_widgets/social_login_button.dart';

class SocialLogInBar extends StatelessWidget {
  const SocialLogInBar({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
  });

  final void Function()? onGooglePressed, onFacebookPressed;

  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}
