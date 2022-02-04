import 'package:flutter/material.dart';

class SinglePriceDetail extends StatelessWidget {
  final String title;
  final String value;
  final double fontSize;
  final Color? colorText;
  final Color? colorValue;
  final FontWeight? fontWeight;

  const SinglePriceDetail({
    Key? key,
    required this.title,
    required this.value,
    required this.fontSize,
    this.colorText,
    this.colorValue,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: colorText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: colorValue,
            ),
          ),
        ],
      ),
    );
  }
}
