import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigmatech/bindings/general_bindings.dart';
import 'package:sigmatech/features/authentication/screens/initial_screen.dart';
import 'package:sigmatech/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sigmatech',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const InitialScreen(),
    );
  }
}