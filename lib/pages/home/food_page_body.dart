import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfc_mob/controller/popular_product_controller.dart';
import 'package:kfc_mob/controller/recomended_product_controller.dart';
import 'package:kfc_mob/design/colors.dart';
import 'package:kfc_mob/design/dimensions.dart';
import 'package:kfc_mob/design/widgets/app_column.dart';
import 'package:kfc_mob/design/widgets/apps_contants.dart';
import 'package:kfc_mob/design/widgets/big_texts.dart';
import 'package:kfc_mob/design/widgets/icon_and_text_widget.dart';
import 'package:kfc_mob/design/widgets/small_text.dart';
import 'package:kfc_mob/models/products_model.dart';
import 'package:kfc_mob/routes/route_helper.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section
        GetBuilder<PopularProductController>(builder: (popularProucts) {
          return popularProucts.isLoaded
              ? Container(
                  color: seryiColor,
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProucts.popularProductList.isEmpty
                        ? 1
                        : popularProucts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position,
                          popularProucts.popularProductList[position]);
                    },
                  ),
                )
              : const CircularProgressIndicator(
                  color: kyzylColor,
                );
        }),

        GetBuilder<PopularProductController>(builder: (popularProucts) {
          return DotsIndicator(
            dotsCount: popularProucts.popularProductList.isEmpty
                ? 1
                : popularProucts.popularProductList.length,
            position: _currPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: kyzylColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        // Popular section
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BigTexts(text: "Recomended :"),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: const EdgeInsets.only(bottom: 3.0),
              child: BigTexts(
                text: ".",
                color: karaColor,
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              child: SmallText(text: "Food pairing"),
            )
          ]),
        ),
//recomended food
        // List of food and images
        GetBuilder<RecomendedProductController>(builder: (recomendedProduct) {
          return recomendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recomendedProduct.recomendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecomendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.width10,
                        ),
                        child: Row(children: [
                          // Image section
                          Container(
                            width: Dimensions.listViewImgSize,
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: akColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      AppConstants.UPLOAD_URI +
                                      recomendedProduct
                                          .recomendedProductList[index].img!),
                                )),
                          ),
                          // Text container
                          Expanded(
                              child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius20)),
                              color: akColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: const AppColumn(text: "KFC"),
                            ),
                          ))
                        ]),
                      ),
                    );
                  })
              : const CircularProgressIndicator(
                  color: kyzylColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
        transform: matrix,
        child: Stack(children: [
          GestureDetector(
            onTap: () {
              Get.to(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xFFCB202D)
                    : const Color(0xFF808080),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URI +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: akColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 3.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigTexts(
                          text: recomendedProduct
                              .recomendedProductList[index].name!),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return const Icon(Icons.star,
                                  color: saryColor, size: 15);
                            }),
                          ),
                          const SizedBox(width: 4),
                          SmallText(text: "4.5"),
                          const SizedBox(width: 3),
                          SmallText(text: "12"),
                          const SizedBox(width: 8),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(height: Dimensions.height20),
                      const Row(children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconcolor: iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7 km ",
                            iconcolor: iconColor2),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "30 min",
                            iconcolor: iconColor3)
                      ])
                    ]),
              ),
            ),
          ),
        ]));
  }
}
