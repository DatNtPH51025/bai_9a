class Wishlist {
  Wishlist({
    this.images,
    this.title,
    this.price,
    this.old_price,
    this.icon,
  });

  Wishlist.fromJson(dynamic json) {
    images = json['images'];
    title = json['title'];
    price = json['price'];
    old_price = json['old_price'];
    icon = json['icon'];
  }

  String? images;
  String? title;
  String? price;
  String? old_price;
  String? icon;

  Wishlist copyWith({
    String? images,
    String? title,
    String? price,
    String? old_price,
    String? icon,
  }) =>
      Wishlist(
        images: images ?? this.images,
        title: title ?? this.title,
        price: price ?? this.price,
        old_price: old_price ?? this.old_price,
        icon: icon ?? this.icon,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    map['title'] = title;
    map['price'] = price;
    map['old_price'] = old_price;
    map['icon'] = icon;
    return map;
  }
}
