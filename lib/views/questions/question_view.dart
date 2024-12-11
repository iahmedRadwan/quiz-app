import 'package:flutter/material.dart';

import 'widgets/question_view_body.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});
  static String routeName = "QuestionView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment(0.26, -0.97),
          end: Alignment(-0.26, 0.97),
          colors: [Color(0xE5060B26), Color(0x7F1A1F37)],
        )),
        child: QuestionViewBody(),
      ),
    );
  }
}
