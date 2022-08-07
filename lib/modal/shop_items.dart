class ShopItems {
  ShopItems({
    required this.cat1,
    required this.cat2,
    required this.cat3,
    required this.cat4,
    required this.cat5,
    required this.cat6,
  });
  late final List<Cat1> cat1;
  late final List<Cat2> cat2;
  late final List<Cat3> cat3;
  late final List<Cat4> cat4;
  late final List<Cat5> cat5;
  late final List<Cat6> cat6;

  ShopItems.fromJson(Map<String, dynamic> json) {
    cat1 = List.from(json['cat1']).map((e) => Cat1.fromJson(e)).toList();
    cat2 = List.from(json['cat2']).map((e) => Cat2.fromJson(e)).toList();
    cat3 = List.from(json['cat3']).map((e) => Cat3.fromJson(e)).toList();
    cat4 = List.from(json['cat4']).map((e) => Cat4.fromJson(e)).toList();
    cat5 = List.from(json['cat5']).map((e) => Cat5.fromJson(e)).toList();
    cat6 = List.from(json['cat6']).map((e) => Cat6.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cat1'] = cat1.map((e) => e.toJson()).toList();
    _data['cat2'] = cat2.map((e) => e.toJson()).toList();
    _data['cat3'] = cat3.map((e) => e.toJson()).toList();
    _data['cat4'] = cat4.map((e) => e.toJson()).toList();
    _data['cat5'] = cat5.map((e) => e.toJson()).toList();
    _data['cat6'] = cat6.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Cat1 {
  Cat1({
    required this.name,
    required this.price,
    required this.instock,
  });
  late final String name;
  late final int price;
  late final bool instock;

  Cat1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['instock'] = instock;
    return _data;
  }
}

class Cat2 {
  Cat2({
    required this.name,
    required this.price,
    required this.instock,
  });
  late final String name;
  late final int price;
  late final bool instock;
  int quantity = 1;

  Cat2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['instock'] = instock;
    return _data;
  }
}

class Cat3 {
  Cat3({
    required this.name,
    required this.price,
    required this.instock,
  });
  late final String name;
  late final int price;
  late final bool instock;
  int quantity = 1;

  Cat3.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['instock'] = instock;
    return _data;
  }
}

class Cat4 {
  Cat4({
    required this.name,
    required this.price,
    required this.instock,
  });
  late final String name;
  late final int price;
  late final bool instock;
  int quantity = 1;

  Cat4.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['instock'] = instock;
    return _data;
  }
}

class Cat5 {
  Cat5({
    required this.name,
    required this.price,
    required this.instock,
  });
  late final String name;
  late final int price;
  late final bool instock;
  int quantity = 1;

  Cat5.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['instock'] = instock;
    return _data;
  }
}

class Cat6 {
  Cat6({
    required this.name,
    required this.price,
    required this.instock,
  });
  late final String name;
  late final int price;
  late final bool instock;
  int quantity = 1;

  Cat6.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    instock = json['instock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['instock'] = instock;
    return _data;
  }
}
