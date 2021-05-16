import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final double cornerRadius;
  final Function function;
  final String content;
  Color buttonColor = Colors.green;
  double contentSize = 14;
  Color textColor = Colors.white;

  CustomButton(
      {this.height,
      this.width,
      this.cornerRadius,
      this.function,
      this.content,
      this.buttonColor,
      this.contentSize,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(4),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
          ),
        ),
        child: Text(content,
            style: TextStyle(fontSize: contentSize, color: textColor)),
      ),
    );
  }
}
