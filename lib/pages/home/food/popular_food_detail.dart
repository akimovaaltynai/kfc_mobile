import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfc_mob/controller/popular_product_controller.dart';
import 'package:kfc_mob/design/colors.dart';
import 'package:kfc_mob/design/dimensions.dart';
import 'package:kfc_mob/design/widgets/app_column.dart';
import 'package:kfc_mob/design/widgets/app_icon.dart';
import 'package:kfc_mob/design/widgets/apps_contants.dart';
import 'package:kfc_mob/design/widgets/big_texts.dart';
import 'package:kfc_mob/design/widgets/expandable_text_widget.dart';
import 'package:kfc_mob/pages/home/main_food_page.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageID;
  const PopularFoodDetail({Key? key, required this.pageID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageID];
    Get.find<PopularProductController>().initProduct();

    return Scaffold(
      backgroundColor: akColor,
      body: Stack(children: [
//backgrounfImage
        Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URI +
                      product.img!),
                )))),

//IconWidgets
        Positioned(
            top: Dimensions.height45,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => const MainFoodPage());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios)),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            )),

//Introduction of food
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularFoodImgSize - 20,
          child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: akColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigTexts(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child:
                            ExpandableTextWidget(text: product.description!)),
                  ),
                ],
              )),
        )
      ]),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: acikseryiColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20 - 3,
                          bottom: Dimensions.height20 - 3,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: saryColor,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.remove,
                            color: karaColor,
                          ),
                          SizedBox(
                            width: Dimensions.width10 / 2,
                          ),
                          BigTexts(text: popularProduct.quantity.toString()),
                          SizedBox(
                            width: Dimensions.width10 / 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(true);
                            },
                            child: const Icon(
                              Icons.add,
                              color: karaColor,
                            ),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20 - 3,
                        bottom: Dimensions.height20 - 3,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: saryColor,
                    ),
                    child: BigTexts(
                      text: "\$ ${product.price!}" " | Add to cart",
                      color: karaColor,
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}
