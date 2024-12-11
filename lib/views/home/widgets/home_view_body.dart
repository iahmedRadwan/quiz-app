import 'package:flutter/material.dart';
import 'package:quiz_app/utilities/app_color.dart';
import 'package:quiz_app/views/questions/question_view.dart';

import '../../../widgets/custom_buttom.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0x7F1A1F37), Color(0xE5060B26)],
          center: Alignment.center,
          radius: 1,
        ),
      ),
      child: Container(
          decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //   begin: Alignment(0.26, -0.97),
              //   end: Alignment(-0.26, 0.97),
              //   colors: [Color(0xE5060B26), Color(0x7F1A1F37)],
              // )),
              ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning,",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Gilroy",
                    color: AppColor.kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "New topic is waiting,",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Gilroy",
                      color: AppColor.kWhiteColor,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(child: Image.asset("assets/images/quizImage.png")),
                CustomButton(
                  buttonText: 'Start Quiz',
                  textColor: AppColor.kPrimaryColor,
                  backgroundColor: AppColor.kWhiteColor,
                  onTap: () {
                    Navigator.pushNamed(context, QuestionView.routeName);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
