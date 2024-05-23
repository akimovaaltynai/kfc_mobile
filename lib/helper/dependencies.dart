import 'package:get/get.dart';
import 'package:kfc_mob/controller/cart_controller.dart';
import 'package:kfc_mob/controller/popular_product_controller.dart';
import 'package:kfc_mob/controller/recomended_product_controller.dart';
import 'package:kfc_mob/data/api/api_clients.dart';
import 'package:kfc_mob/data/repository/cart_repo.dart';
import 'package:kfc_mob/data/repository/popular_product_repo.dart';
import 'package:kfc_mob/data/repository/recomended_product_repo.dart';
import 'package:kfc_mob/design/widgets/apps_contants.dart';

Future<void> init() async {
  //апи клиент
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

//репозитори
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

//контроллер
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecomendedProductController(recomendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
