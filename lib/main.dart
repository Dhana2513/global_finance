import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/home/home_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x00FFFDFEFF),
        accentColor: const Color(0x00FF292C61),
        colorScheme: ColorScheme.light(
          primary: const Color(0x00FF292C61),
          secondary: const Color(0x00FF2C2F63),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
