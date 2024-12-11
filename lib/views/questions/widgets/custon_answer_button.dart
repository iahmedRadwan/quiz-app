import 'package:flutter/material.dart';

import '../../../utilities/app_color.dart';

class CustomAnswerButton extends StatelessWidget {
  const CustomAnswerButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      this.borderColor,
      required this.isSelected});
  final String buttonText;
  final void Function()? onTap;
  final Color? borderColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(1.00, 0.02),
                  end: const Alignment(-1, -0.02),
                  colors: isSelected
                      ? [const Color(0xFFB8B2FF), const Color(0xFFC6C2F7)]
                      : [Colors.white, Colors.white],
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isSelected
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColor.kPrimaryColor,
                            child: const Center(
                                child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ))),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 9.5,
                          backgroundColor: AppColor.kPrimaryColor,
                          child: const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? Colors.white : AppColor.kPrimaryColor,
                    fontFamily: "Gilroy",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
