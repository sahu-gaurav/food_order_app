import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_order_demo/constant.dart';
import 'package:food_order_demo/controller/cart_item_controller.dart';
import 'package:food_order_demo/controller/shop_items_controller.dart';
import 'package:food_order_demo/modal/shop_items.dart';
import 'package:food_order_demo/view/cart_screen.dart';
import 'package:food_order_demo/view/widgets/add_item_widget.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({Key? key}) : super(key: key);

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  ShopItemsCntroller _shopItemsCntroller = Get.put(ShopItemsCntroller());
  Cart _cartCntroller = Get.put(Cart());
  final GlobalKey expansionTile = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GetBuilder<Cart>(
        builder: (controller) {
          return _cartCntroller.items.isEmpty
              ? const SizedBox()
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    color: amber,
                    child: ListTile(
                        onTap: () {
                          Get.to(() => const CartScreen());
                        },
                        title: _cartCntroller.itemCount == 1
                            ? Text(
                                "${_cartCntroller.itemCount} Item",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              )
                            : Text(
                                "${_cartCntroller.itemCount} Items",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                        subtitle: Text(
                          "\$ ${_cartCntroller.totalAmount}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w300),
                        ),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Row(
                            children: const [
                              Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
                  ),
                );
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
          children: [
            GetBuilder<ShopItemsCntroller>(builder: (controller) {
              return controller.enabledShimmer.value
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: controller.enabledShimmer.value,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return const Card(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 36.0,
                                      left: 6.0,
                                      right: 6.0,
                                      bottom: 6.0),
                                  child: ExpansionTile(
                                    title: Text("dada"),
                                    children: <Widget>[
                                      Text('Big Bang'),
                                      Text('Birth of the Sun'),
                                      Text('Earth is Born'),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  const Text("3"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[6]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(6, val);
                              },
                              title: const Text("Popular Items"),
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    controller.shopItems.cat1[0].name,
                                    style: TextStyle(
                                      color:
                                          controller.shopItems.cat1[0].instock
                                              ? Colors.white
                                              : Colors.grey,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "\$ " +
                                        controller.shopItems.cat1[0].price
                                            .toString(),
                                    style: TextStyle(
                                      color:
                                          controller.shopItems.cat1[0].instock
                                              ? Colors.white
                                              : Colors.grey,
                                    ),
                                  ),
                                  trailing: AddItem(
                                    category: "1",
                                    name: controller.shopItems.cat1[0].name,
                                    price: controller.shopItems.cat1[0].price,
                                    instock:
                                        controller.shopItems.cat1[0].instock,
                                  ),
                                ),
                                ListTile(
                                  title: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.shopItems.cat1[3].name,
                                          style: TextStyle(
                                            color: controller
                                                    .shopItems.cat1[3].instock
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                        Card(
                                          color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "BestSeller",
                                              style: TextStyle(
                                                color: controller.shopItems
                                                        .cat1[3].instock
                                                    ? Colors.white
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Text(
                                    "\$ " +
                                        controller.shopItems.cat1[3].price
                                            .toString(),
                                    style: TextStyle(
                                      color:
                                          controller.shopItems.cat1[3].instock
                                              ? Colors.white
                                              : Colors.grey,
                                    ),
                                  ),
                                  trailing: AddItem(
                                    category: "1",
                                    name: controller.shopItems.cat1[3].name,
                                    price: controller.shopItems.cat1[3].price,
                                    instock:
                                        controller.shopItems.cat1[3].instock,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    controller.shopItems.cat6[0].name,
                                    style: TextStyle(
                                      color:
                                          controller.shopItems.cat6[0].instock
                                              ? Colors.white
                                              : Colors.grey,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "\$ " +
                                        controller.shopItems.cat6[0].price
                                            .toString(),
                                    style: TextStyle(
                                      color:
                                          controller.shopItems.cat6[0].instock
                                              ? Colors.white
                                              : Colors.grey,
                                    ),
                                  ),
                                  trailing: AddItem(
                                    category: "6",
                                    name: controller.shopItems.cat6[0].name,
                                    price: controller.shopItems.cat6[0].price,
                                    instock:
                                        controller.shopItems.cat6[0].instock,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  Text(controller.shopItems.cat1.length
                                      .toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[0]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(0, val);
                              },
                              title: const Text("Category 1"),
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.shopItems.cat1.length,
                                      itemBuilder: (ctx, idx) {
                                        return ListTile(
                                          title: Text(
                                            controller.shopItems.cat1[idx].name,
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat1[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\$ " +
                                                controller
                                                    .shopItems.cat1[idx].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat1[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          trailing: AddItem(
                                            category: "1",
                                            name: controller
                                                .shopItems.cat1[idx].name,
                                            price: controller
                                                .shopItems.cat1[idx].price,
                                            instock: controller
                                                .shopItems.cat1[idx].instock,
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  Text(
                                    controller.shopItems.cat2.length.toString(),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[1]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(1, val);
                              },
                              title: const Text("Category 2"),
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.shopItems.cat2.length,
                                      itemBuilder: (ctx, idx) {
                                        return ListTile(
                                          title: Text(
                                            controller.shopItems.cat2[idx].name,
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat2[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\$ " +
                                                controller
                                                    .shopItems.cat2[idx].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat2[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          trailing: AddItem(
                                            category: "2",
                                            name: controller
                                                .shopItems.cat2[idx].name,
                                            price: controller
                                                .shopItems.cat2[idx].price,
                                            instock: controller
                                                .shopItems.cat2[idx].instock,
                                            // quantity: controller
                                            //     .shopItems.cat2[idx].quantity,
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  Text(controller.shopItems.cat3.length
                                      .toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[2]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(2, val);
                              },
                              title: const Text("Category 3"),
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.shopItems.cat3.length,
                                      itemBuilder: (ctx, idx) {
                                        return ListTile(
                                          title: Text(
                                            controller.shopItems.cat3[idx].name,
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat3[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\$ " +
                                                controller
                                                    .shopItems.cat3[idx].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat3[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          trailing: AddItem(
                                            category: "3",
                                            name: controller
                                                .shopItems.cat3[idx].name,
                                            price: controller
                                                .shopItems.cat3[idx].price,
                                            instock: controller
                                                .shopItems.cat3[idx].instock,
                                            // quantity: controller
                                            //     .shopItems.cat3[idx].quantity,
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  Text(controller.shopItems.cat4.length
                                      .toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[3]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(3, val);
                              },
                              title: const Text("Category 4"),
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.shopItems.cat4.length,
                                      itemBuilder: (ctx, idx) {
                                        return ListTile(
                                          title: Text(
                                            controller.shopItems.cat4[idx].name,
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat4[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\$ " +
                                                controller
                                                    .shopItems.cat4[idx].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat4[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          trailing: AddItem(
                                            category: "4",
                                            name: controller
                                                .shopItems.cat4[idx].name,
                                            price: controller
                                                .shopItems.cat4[idx].price,
                                            instock: controller
                                                .shopItems.cat4[idx].instock,
                                            // quantity: controller
                                            //     .shopItems.cat4[idx].quantity,
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  Text(controller.shopItems.cat5.length
                                      .toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[4]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(4, val);
                              },
                              title: const Text("Category 5"),
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.shopItems.cat5.length,
                                      itemBuilder: (ctx, idx) {
                                        return ListTile(
                                          title: Text(
                                            controller.shopItems.cat5[idx].name,
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat5[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\$ " +
                                                controller
                                                    .shopItems.cat5[idx].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat5[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          trailing: AddItem(
                                            category: "5",
                                            name: controller
                                                .shopItems.cat5[idx].name,
                                            price: controller
                                                .shopItems.cat5[idx].price,
                                            instock: controller
                                                .shopItems.cat5[idx].instock,
                                            // quantity: controller
                                            //     .shopItems.cat5[idx].quantity,
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                            child: ExpansionTile(
                              trailing: Wrap(
                                children: [
                                  Text(controller.shopItems.cat6.length
                                      .toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  controller.showDropDown[5]
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                              onExpansionChanged: (val) {
                                // log("$index,$val");
                                //  items.cat1[index].quantity = items.cat1[index].quantity + 1;
                                controller.changeDropDownStatus(5, val);
                              },
                              title: const Text("Category 6"),
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.shopItems.cat6.length,
                                      itemBuilder: (ctx, idx) {
                                        return ListTile(
                                          title: Text(
                                            controller.shopItems.cat6[idx].name,
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat6[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\$ " +
                                                controller
                                                    .shopItems.cat6[idx].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: controller.shopItems
                                                      .cat6[idx].instock
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                          trailing: AddItem(
                                            category: "6",
                                            name: controller
                                                .shopItems.cat6[idx].name,
                                            price: controller
                                                .shopItems.cat6[idx].price,
                                            instock: controller
                                                .shopItems.cat6[idx].instock,
                                            // quantity: controller
                                            //     .shopItems.cat6[idx].quantity,
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            })
          ],
        ),
      ),
    );
  }
}
