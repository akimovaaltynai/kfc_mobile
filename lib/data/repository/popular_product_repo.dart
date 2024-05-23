import 'package:get/get.dart';
import 'package:kfc_mob/data/api/api_clients.dart';
import 'package:kfc_mob/design/widgets/apps_contants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
