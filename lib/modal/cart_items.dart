import 'package:flutter/foundation.dart';

class CartItems {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItems({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
