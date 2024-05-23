// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:kfc_mob/design/dimensions.dart';

class BigTexts extends StatelessWidget {
  Color? color;
  final String text;
  TextOverflow overflow;
  double size;

  BigTexts(
      {Key? key,
      this.color = const Color(0xFF000000),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.fade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimensions.font20 : size,
          color: color,
          fontWeight: FontWeight.w400,
        ));
  }
}
