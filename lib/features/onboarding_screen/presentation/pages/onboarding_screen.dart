import 'package:flutter/material.dart';
import 'package:slidee_app/features/onboarding_screen/presentation/widgets/onboarding_view_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingViewItem(),
    );
  }
}
