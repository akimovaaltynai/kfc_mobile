import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfc_mob/controller/recomended_product_controller.dart';
import 'package:kfc_mob/design/colors.dart';
import 'package:kfc_mob/design/dimensions.dart';
import 'package:kfc_mob/design/widgets/app_icon.dart';
import 'package:kfc_mob/design/widgets/apps_contants.dart';
import 'package:kfc_mob/design/widgets/big_texts.dart';
import 'package:kfc_mob/design/widgets/expandable_text_widget.dart';
import 'package:kfc_mob/routes/route_helper.dart';

class RecomendedFoodDetail extends StatelessWidget {
  final int pageID;
  const RecomendedFoodDetail({Key? key, required this.pageID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecomendedProductController>().recomendedProductList[pageID];
    return Scaffold(
      backgroundColor: akColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(icon: Icons.clear),
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                //    margin: EdgeInsets.only(
                //       left: Dimensions.width20, right: Dimensions.width20),
                color: akColor,
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                )),
                child: Center(
                    child: BigTexts(
                  size: Dimensions.font26,
                  text: product.name!,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: orangeColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              AppConstants.BASE_URL + AppConstants.UPLOAD_URI + product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
              child: Column(children: [
            Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(text: product.description!))
          ]))
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width20 * 2.5,
            right: Dimensions.width20 * 2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: akColor,
                  backgroundColor: karaColor,
                  icon: Icons.remove),
              BigTexts(
                  text: "\$ ${product.price} X  0 ",
                  color: karaColor,
                  size: Dimensions.font26),
              AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: akColor,
                  backgroundColor: karaColor,
                  icon: Icons.add),
            ],
          ),
        ),
        Container(
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              child: const Icon(Icons.favorite, color: kyzylColor),
            ),
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
                text: "\$10 | Add to cart",
                color: karaColor,
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
