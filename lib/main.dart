import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/app/themes/main_theme.dart';
import 'package:kostrushapp/res/routes/app_pages.dart';

import 'di/application_module.dart';

// late final PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // packageInfo = await PackageInfo.fromPlatform();

  await initApplicationModule();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      theme: MainTheme.lightTheme(context),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
