import 'dart:developer';

import 'package:food_order_demo/modal/shop_items.dart';
import 'package:get/get.dart';

import '../constant.dart';

class ShopItemsCntroller extends GetxController {
  late Rx<ShopItems> _shopItems;
  // late Rx<ShopItems> shopItems;
  RxBool enabledShimmer = true.obs;
  List<bool> showDropDown = [false, false, false, false, false, false, false];
  ShopItems get shopItems => _shopItems.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      enabledShimmer = false.obs;
      log("${enabledShimmer.value}");
      var ab = ShopItems.fromJson(itemsJson);
      _shopItems = ab.obs;
      // shopItems = ShopItems.fromJson(itemsJson) as Rx<ShopItems>;
      update();
    });
  }

  changeDropDownStatus(index, value) {
    showDropDown[index] = value;
    update();
  }
}
