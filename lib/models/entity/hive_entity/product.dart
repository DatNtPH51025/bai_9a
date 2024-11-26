import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)

/// trung id bao loi
class Product {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String oldPrice;
  @HiveField(3)
  final String image;

  Product(this.name, this.price, this.oldPrice, this.image);
}
