import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfc_mob/controller/popular_product_controller.dart';
import 'package:kfc_mob/controller/recomended_product_controller.dart';
import 'package:kfc_mob/pages/home/main_food_page.dart';
import 'package:kfc_mob/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Altynai, privet',
        home: const MainFoodPage(),
        initialRoute: RouteHelper.initial,
        getPages: RouteHelper.routes);
  }
}
