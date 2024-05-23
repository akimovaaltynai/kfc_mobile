import 'package:get/get.dart';
import 'package:kfc_mob/pages/home/food/popular_food_detail.dart';
import 'package:kfc_mob/pages/home/food/recommended_food_detail.dart';
import 'package:kfc_mob/pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recomendedFood = "/recomended-food";

  static String getInitial() => initial;

  static String getPopularFood(int pageID) => '$popularFood?pageID=$pageID';
  static String getRecomendedFood(int pageID) =>
      '$recomendedFood?pageID=$pageID';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageID = Get.parameters['pageID'];

        return PopularFoodDetail(pageID: int.parse(pageID!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recomendedFood,
      page: () {
        var pageID = Get.parameters['pageID'];

        return RecomendedFoodDetail(pageID: int.parse(pageID!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
