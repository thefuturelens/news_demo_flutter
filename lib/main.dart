import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo_flutter/routes/app_route.dart';
import 'package:news_demo_flutter/views/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      getPages: AppRoute.pages,
    );
  }
}
