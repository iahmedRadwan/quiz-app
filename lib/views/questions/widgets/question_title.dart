import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/app_color.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
    required this.questionTitle,
    required this.imagePath,
  });
  final String questionTitle;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 35,
        width: 100,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1.00, 0.02),
            end: Alignment(-1, -0.02),
            colors: [Color(0xFFB8B2FF), Color(0xFFC6C2F7)],
          ),
          borderRadius: BorderRadius.circular(20),
          color: AppColor.kSecondryColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                imagePath,
                width: 18,
              ),
            ),
            Text(
              questionTitle,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Gilroy",
                  color: AppColor.kWhiteColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
