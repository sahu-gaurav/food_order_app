import 'package:flutter/material.dart';
import 'package:food_order_demo/constant.dart';
import 'package:food_order_demo/controller/cart_item_controller.dart';
import 'package:food_order_demo/view/widgets/cart_item_widget.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: GetBuilder<Cart>(builder: (controller) {
          return Column(
            children: [
              Card(
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount:',
                        style: TextStyle(
                          color: amber,
                        ),
                      ),
                      Chip(
                        label: Text(
                          '\$${controller.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: amber,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (controller.itemCount == 0) ? 150 : 60,
                  child: (controller.itemCount == 0)
                      ? Column(
                          children: [
                            Center(
                              child: Text(
                                'Your Cart Is Empty!!',
                                style: TextStyle(color: amber, fontSize: 30),
                                softWrap: true,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Looks like you have not added anything in the cart yet.',
                                  style: TextStyle(
                                    color: amber,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            )
                          ],
                        )
                      : ElevatedButton(
                          child: const Text(
                            'Proceed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          // onPressed: () => displayBottomSheet(context),
                          onPressed: () {
                            Get.back();
                            Get.snackbar(
                              "Order Placed",
                              "Thank your for ordering!!\nYour order will reach you in 25 minutes.",
                            );
                            controller.clear();
                          },
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              (controller.itemCount == 0)
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Swipe Left to remove items",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.itemCount,
                  itemBuilder: (ctx, i) => CartItem(
                    productId: controller.items.values.toList()[i].id,
                    title: controller.items.values.toList()[i].name,
                    quantity: controller.items.values.toList()[i].quantity,
                    price: controller.items.values.toList()[i].price,
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
