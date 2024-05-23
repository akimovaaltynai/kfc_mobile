import 'package:flutter/material.dart';
import 'package:kfc_mob/design/colors.dart';
import 'package:kfc_mob/design/dimensions.dart';
import 'package:kfc_mob/design/widgets/small_text.dart';
import 'package:kfc_mob/pages/home/food_page_body.dart';
import '../../design/widgets/big_texts.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: const EdgeInsets.only(left: 20, right: 20),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigTexts(
                      text: "Кыргызстан",
                      color: kyzylColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Бишкек",
                          color: karaColor,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: kyzylColor,
                        ),
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        child: Icon(Icons.search,
                            color: akColor, size: Dimensions.iconSize24))),
              ],
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
