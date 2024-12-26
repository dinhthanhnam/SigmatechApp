import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sigmatech/features/authentication/controllers/login/login_controller.dart';
import 'package:sigmatech/features/authentication/screens/signup/signup.dart';
import 'package:sigmatech/navigation_menu.dart';
import 'package:sigmatech/utils/constants/sizes.dart';
import 'package:sigmatech/utils/constants/text_strings.dart';
import 'package:sigmatech/utils/validators/validation.dart';
class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          //Password
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),
    
          //Remember Me & Forget password
          Row(
            children: [
              //remember me
              Row(
                children: [
                  Obx(
                  () => Checkbox(
                    value: controller.rememberMe.value, 
                    onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)
                  ),
                  const Text(TTexts.rememberMe),
                ],
              ),
              //forget password
              TextButton(onPressed: () {} , child: const Text(TTexts.forgetPassword)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          
          //Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signin(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF408591), // Màu nền
                foregroundColor: Colors.white, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Góc bo tròn
                ),
              ),
              child: const Text(TTexts.signIn),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

// Create account button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFF408591), // Màu chữ
                side: BorderSide(color: Color(0xFF408591)), // Viền nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Góc bo tròn
                ),
              ),
              child: const Text(TTexts.createAccount),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      )
    );
  }
}
