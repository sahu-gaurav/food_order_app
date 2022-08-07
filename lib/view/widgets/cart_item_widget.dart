import 'package:flutter/material.dart';
import 'package:food_order_demo/constant.dart';
import 'package:food_order_demo/controller/cart_item_controller.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String title;
  final int quantity;
  final double price;

// ignore: use_key_in_widget_constructors
  const CartItem({
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    TextStyle style =
        const TextStyle(fontFamily: 'CaviarDreams', fontSize: 20.0);

    return GetBuilder<Cart>(builder: (controller) {
      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Theme.of(context).errorColor,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text('Are you sure ?'),
                    content: const Text('Do you want to remove the item.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ));
        },
        onDismissed: (direction) {
          controller.removeItem(productId);
          // Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: SizedBox(
            // decoration: BoxDecoration(
            //   // border:
            //   //     Border.all(color: golden, width: 2, style: BorderStyle.solid),
            //   image: DecorationImage(
            //     image: AssetImage('assets/blackbg.png'),
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  title,
                  style: style.copyWith(
                    color: amber,
                  ),
                ),
                subtitle: Text(
                  'Total: \$${(price * quantity).toStringAsFixed(2)}',
                  style: TextStyle(
                    color: amber,
                  ),
                ),
                trailing: Text(
                  '$quantity x',
                  style: style.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
