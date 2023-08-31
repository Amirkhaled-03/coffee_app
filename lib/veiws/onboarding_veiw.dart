import 'package:coffee_app/constants.dart';
import 'package:coffee_app/veiws/widgets/get_started_onboarding.dart';
import 'package:flutter/material.dart';

class OnboardingVeiw extends StatelessWidget {
  const OnboardingVeiw({super.key});
  static String id = "OnboardingVeiw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "Assets/photos/Onboarding.png",
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Good coffee,\nGood friends,\n let it blends",
              style: TextStyle(
                height: 1.15,
                color: kSecondaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "The best grain, the finest roast,\n      the most powerful flavor.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 35),
            OnboardingGetStarted(),
            SizedBox(height: 60),
          ],
        ),
      ],
    ));
  }
}
