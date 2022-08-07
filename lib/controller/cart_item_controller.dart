import 'package:food_order_demo/modal/cart_items.dart';
import 'package:get/get.dart';

class Cart extends GetxController {
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.00;

    _items.forEach((key, value) {
      total += (value.price * value.quantity);
    });
    double amount = double.parse(total.toStringAsFixed(2));

    return amount;
  }

  bool findKey(String prodId) {
    if (_items.containsKey(prodId)) {
      return true;
    } else {
      return false;
    }
  }

  int get totalItems {
    int quantity = 0;
    _items.forEach((key, value) {
      quantity += value.quantity;
    });
    return quantity;
  }

  void addItem({
    required String productId,
    required double price,
    required String title,
    required int quantity,
  }) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItems(
          id: value.id,
          name: value.name,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItems(
          id: productId,
          name: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    update();
  }

  void subQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity >= 2) {
        _items.update(
          productId,
          (value) => CartItems(
            id: value.id,
            name: value.name,
            price: value.price,
            quantity: value.quantity - 1,
          ),
        );
      } else
        _items.remove(productId);
    }
    update();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
