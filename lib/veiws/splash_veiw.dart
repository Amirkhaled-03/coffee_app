import 'package:coffee_app/veiws/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashVeiw extends StatelessWidget {
  const SplashVeiw({super.key});
  static String id = "OnboardingVeiw";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:SplashViewBody());
  }
}
