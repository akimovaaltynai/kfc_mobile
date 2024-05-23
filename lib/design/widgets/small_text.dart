// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  double height;
  final String text;
  double size;
  TextOverflow overFlow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFF000000),
      required this.text,
      this.size = 10,
      this.height = 1.8,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overFlow,
        style: TextStyle(
            fontFamily: 'Roboto', color: color, fontWeight: FontWeight.w400));
  }
}
