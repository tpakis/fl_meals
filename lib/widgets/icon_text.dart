import 'package:flutter/material.dart';

class IconText extends StatelessWidget {

  final IconData iconData;
  final String text;

  const IconText({
    this.iconData, this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
        ),
        SizedBox(
          width: 6,
        ),
        Text(text)
      ],
    );
  }
}