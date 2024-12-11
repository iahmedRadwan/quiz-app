import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      required this.textColor,
      required this.backgroundColor,
      this.borderColor,
      this.icon,
      this.isIconLeft = true});
  final String buttonText;
  final void Function()? onTap;
  final Color textColor;
  final Color backgroundColor;
  final Color? borderColor;
  final IconData? icon;
  final bool isIconLeft;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: borderColor ?? backgroundColor))),
        ),
        child: icon == null
            ? Text(
                buttonText,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isIconLeft ? Icon(icon) : Container(),
                  Text(
                    buttonText,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: textColor),
                  ),
                  isIconLeft ? Container() : Icon(icon),
                ],
              ),
      ),
    );
  }
}
