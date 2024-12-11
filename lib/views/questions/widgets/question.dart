import 'package:flutter/material.dart';

import '../../../utilities/app_color.dart';

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: TextStyle(
          fontSize: 24,
          fontFamily: "Gilroy",
          color: AppColor.kWhiteColor,
          fontWeight: FontWeight.w500),
    );
  }
}
