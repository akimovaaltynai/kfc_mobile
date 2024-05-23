import 'package:get/get.dart';
import 'package:kfc_mob/data/repository/recomended_product_repo.dart';
import 'package:kfc_mob/models/products_model.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;
  RecomendedProductController({required this.recomendedProductRepo});
  List<dynamic> _recomendedProductList = [];
  List<dynamic> get recomendedProductList =>
      _recomendedProductList; // Поменяли имя

  bool _isLoaded = false; // Rename this variable
  bool get isLoaded => _isLoaded;

  Future<void> getRecomendedProductList() async {
    Response response = await recomendedProductRepo.getRecomendedProductList();

    if (response.statusCode == 200) {
      // print("got product recomended");
      _recomendedProductList = [];
      _recomendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true; // Set the value here when data is loaded
      update();
    } else {
      _isLoaded = false; // Handle the case where data is not loaded
      // print("Could not got product recomended");
    }
  }
}
