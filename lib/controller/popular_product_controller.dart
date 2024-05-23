import 'package:get/get.dart';
import 'package:kfc_mob/data/repository/popular_product_repo.dart';
import 'package:kfc_mob/design/colors.dart';
import 'package:kfc_mob/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false; // Rename this variable
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get intCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      //  print("got product...");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true; // Set the value here when data is loaded
      update();
    } else {
      _isLoaded = false; // Handle the case where data is not loaded
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = chekQuantity(_quantity + 1);
    } else {
      _quantity = chekQuantity(_quantity - 1);
    }
    update();
  }

  int chekQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !!!",
          backgroundColor: kyzylColor, colorText: akColor);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item count", "You can't add more !!!",
          backgroundColor: kyzylColor, colorText: akColor);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
    _inCartItems = 0;
    //if exist
    //get from storage inCartItems=3
  }
}
