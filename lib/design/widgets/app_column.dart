import 'package:flutter/material.dart';
import 'package:kfc_mob/design/colors.dart';
import 'package:kfc_mob/design/dimensions.dart';
import 'package:kfc_mob/design/widgets/big_texts.dart';
import 'package:kfc_mob/design/widgets/icon_and_text_widget.dart';
import 'package:kfc_mob/design/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BigTexts(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(text: "Рецепты от шеф повара "),
        SizedBox(
          height: Dimensions.height10,
        ),
        const Row(children: [
          IconAndTextWidget(
              icon: Icons.circle_sharp, text: "Normal", iconcolor: iconColor1),
          IconAndTextWidget(
              icon: Icons.location_on, text: "1.7 km ", iconcolor: iconColor2),
          IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "30 min",
              iconcolor: iconColor3)
        ])
      ],
    );
  }
}
