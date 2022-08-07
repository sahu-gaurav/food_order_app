import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_order_demo/constant.dart';
import 'package:food_order_demo/controller/cart_item_controller.dart';
import 'package:food_order_demo/controller/shop_items_controller.dart';
import 'package:get/get.dart';

class AddItem extends StatelessWidget {
  String category;
  String name;
  int price;
  bool instock;

  AddItem({
    required this.category,
    required this.name,
    required this.price,
    required this.instock,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Cart>(builder: (controller) {
      return controller.items.isEmpty ||
              !controller.findKey(category + "@" + name)
          ? IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: !instock ? Colors.grey : amber,
              ),
              onPressed: () {
                if (!instock) {
                  Get.snackbar(
                    "Item Unavailable",
                    "This Item is not in stock!!",
                  );
                  return;
                }
                controller.addItem(
                    productId: category + "@" + name,
                    title: name,
                    price: price.toDouble(),
                    quantity: 0);
                // cart.addItem(menuId, productId, itemPrice,
                //     name, itemImageUrl);
                // Get.snackbar("Added", "Item added to cart");
                //  widget.foodItemList[index].orderQuantity++;
                // showModalBottomSheet(context: context, builder: (_){
                //   return SetQuantity();
                // });
              },
            )
          : Container(
              width: MediaQuery.of(context).size.width * 0.175,
              padding: const EdgeInsets.all(5),
              // color: Colors.white,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: amber,
                  width: 2.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 25.0,
                      color: amber,
                    ),
                    onTap: () {
                      controller.addItem(
                          productId: category + "@" + name,
                          title: name,
                          price: price.toDouble(),
                          quantity: 0);
                    },
                  ),
                  Text(controller.items[category + "@" + name]!.quantity
                      .toString()),
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 25.0,
                      color: amber,
                    ),
                    onTap: () {
                      controller.subQuantity(category + "@" + name);
                    },
                  ),
                ],
              ),
            );
    });
  }
}
