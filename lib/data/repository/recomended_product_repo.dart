import 'package:get/get.dart';
import 'package:kfc_mob/data/api/api_clients.dart';
import 'package:kfc_mob/design/widgets/apps_contants.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecomendedProductRepo({required this.apiClient});

  Future<Response> getRecomendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMENDED_PRODUCT_URI);
  }
}
