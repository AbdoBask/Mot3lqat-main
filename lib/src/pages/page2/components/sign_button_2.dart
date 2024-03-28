import 'package:Mot3lqat/src/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:Mot3lqat/src/config/themes/app_styles.dart';


class SignButton2 extends StatelessWidget {
  final String text;
  final String followUpText;
  final String command;
  const SignButton2(
      {super.key,
      required this.text,
      required this.followUpText,
      required this.command});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.HomePage);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 5, 56, 97),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(0, 50),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Text(text, style: AppStyles.subHeaderStyle),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(followUpText, style: AppStyles.bodyStyle),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                command,
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
