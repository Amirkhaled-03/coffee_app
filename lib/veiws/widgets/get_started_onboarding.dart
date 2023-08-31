import 'package:coffee_app/veiws/login_veiw.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OnboardingGetStarted extends StatelessWidget {
  const OnboardingGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 285,
          height: 62,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: Colors.amberAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(45))),
                backgroundColor: kTertiaryColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginVeiw();
                }));
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      ],
    );
  }
}
