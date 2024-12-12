import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigmatech/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:sigmatech/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:sigmatech/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:sigmatech/utils/constants/colors.dart';
import 'package:sigmatech/utils/constants/image_strings.dart';
import 'package:sigmatech/utils/constants/sizes.dart';
import 'package:sigmatech/utils/constants/text_strings.dart';
import 'package:sigmatech/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:sigmatech/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:sigmatech/utils/device/device_utility.dart';
import 'package:sigmatech/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
        body: Stack(
      children: [
        //Horizontal Scrollable Pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: Timages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subTitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: Timages.onBoardingImage2,
              title: TTexts.onBoardingTitle2,
              subTitle: TTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: Timages.onBoardingImage3,
              title: TTexts.onBoardingTitle3,
              subTitle: TTexts.onBoardingSubTitle3,
            )
          ],
        ),
        //skip button
        const OnBoardingSkip(),
        // Dot navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),
        //circular button
        const OnBoardingNextButton()
      ],
    ));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}