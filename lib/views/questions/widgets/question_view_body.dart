import 'package:flutter/material.dart';
import 'package:quiz_app/utilities/app_color.dart';
import 'package:quiz_app/views/questions/models/question_model.dart';
import 'package:quiz_app/widgets/custom_buttom.dart';
import 'custon_answer_button.dart';
import 'question.dart';
import 'question_title.dart';

class QuestionViewBody extends StatefulWidget {
  const QuestionViewBody({super.key});

  @override
  State<QuestionViewBody> createState() => _QuestionViewBodyState();
}

class _QuestionViewBodyState extends State<QuestionViewBody> {
  List<QuestionModel> questions = [
    QuestionModel(
        question:
            "How would you describe your level of satisfaction with the healthcare system?",
        answers: [
          AnswerModel(answers: "Strongly satisfied"),
          AnswerModel(answers: "Satisfied"),
          AnswerModel(answers: "Neutral"),
          AnswerModel(answers: "Not satisfied"),
        ],
        correctAnswer: "Satisfied"),
    QuestionModel(
        question: "What vitamins do you take?",
        answers: [
          AnswerModel(answers: "Vitamin D3"),
          AnswerModel(answers: "Vitamin B"),
          AnswerModel(answers: "Zinc"),
          AnswerModel(answers: "Magnesium"),
        ],
        correctAnswer: "Zinc"),
  ];
  late PageController pageController;
  late int currentPage;
  late double scoreUser;
  late double scorePerQuestion;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    currentPage = 0;
    scorePerQuestion = (100 / questions.length);
    scoreUser = 0;
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 60),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int qIndex) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionTitle(
                    questionTitle: 'Question ${qIndex + 1}',
                    imagePath: "assets/images/q${qIndex + 1}.svg",
                  ),
                  Question(
                    question: questions[qIndex].question,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          CustomAnswerButton(
                        buttonText: questions[qIndex].answers[index].answers,
                        isSelected: questions[qIndex].answers[index].isSelect,
                        onTap: () {
                          if (questions[qIndex].answers[index].isSelect ==
                              true) {
                            questions[qIndex].answers[index].isSelect = false;
                          } else {
                            for (var item in questions[qIndex].answers) {
                              item.isSelect = false;
                              if (item.answers ==
                                  questions[qIndex].correctAnswer) {
                                scoreUser += currentPage;
                              }
                              questions[qIndex].answers[index].isSelect = true;
                            }
                          }

                          setState(() {});
                        },
                      ),
                      itemCount: questions[qIndex].answers.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  buttonText: "Back",
                  textColor: Colors.white,
                  onTap: () {
                    currentPage == 1
                        ? pageController.animateToPage(0,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.bounceIn)
                        : Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_ios,
                  backgroundColor: Colors.transparent,
                  borderColor: AppColor.kSecondryColor,
                ),
              ),
              const Spacer(),
              Expanded(
                child: CustomButton(
                  buttonText: "Next",
                  textColor: Colors.white,
                  isIconLeft: false,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    print(scoreUser * 100);
                    currentPage == 0
                        ? pageController.animateToPage(1,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.bounceIn)
                        : currentPage;
                  },
                  backgroundColor: AppColor.kSecondryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
