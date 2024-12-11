import 'package:flutter/material.dart';
import 'package:quiz_app/utilities/app_color.dart';
import 'package:quiz_app/utilities/app_router.dart';
import 'package:quiz_app/views/home/home_view.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRouter,
      initialRoute: HomeView.routeName,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.kPrimaryColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColor.kPrimaryColor)),
    );
  }
}
