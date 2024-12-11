import 'package:flutter/material.dart';
import 'package:quiz_app/views/home/home_view.dart';
import 'package:quiz_app/views/questions/question_view.dart';

Map<String, WidgetBuilder> appRouter = {
  HomeView.routeName: (context) => const HomeView(),
  QuestionView.routeName: (context) => const QuestionView(),
};
