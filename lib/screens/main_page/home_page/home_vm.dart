import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/models/entity/categories_model.dart';
import 'package:bai_9a/models/entity/product.dart';
import 'package:flutter/material.dart';

class HomeVm extends ChangeNotifier {
  int index = 0;
  PageController controller = PageController();
  final List<CategoriesModel> categories = [
    CategoriesModel(
      idCate: '1',
      name: 'Electronics',
      image: AppImages.img_electronics,
    ),
    CategoriesModel(
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_fashion,
    ),
    CategoriesModel(
      idCate: '3',
      name: 'Furniture',
      image: AppImages.img_furniture,
    ),
    CategoriesModel(
      idCate: '4',
      name: 'Industrial',
      image: AppImages.img_industrial,
    ),
    CategoriesModel(
      idCate: '5',
      name: 'Home Decor',
      image: AppImages.img_homeDecor,
    ),
    CategoriesModel(
      idCate: '6',
      name: 'Electronics (TV)',
      image: AppImages.img_electronicsTV,
    ),
    CategoriesModel(
      idCate: '7',
      name: 'Health',
      image: AppImages.img_health,
    ),
    CategoriesModel(
      idCate: '8',
      name: 'Construction & Real Estate',
      image: AppImages.img_construction,
    ),
    CategoriesModel(
      idCate: '9',
      name: 'Fabrication Service',
      image: AppImages.img_fabricationService,
    ),
    CategoriesModel(
      idCate: '10',
      name: 'Electrical Equipment',
      image: AppImages.img_electricalEquipment,
    ),
  ];
  List<Product> products = [
    Product(
      name: 'Nike Air Jordan Retro',
      price: '\$126.00',
      oldPrice: '\$186.00',
      image: AppImages.img_shoes,
      // colors: [Colors.black, Colors.greenAccent, Colors.green],
    ),
    Product(
      name: 'Classic New Black Glasses',
      price: '\$85.00',
      oldPrice: '\$100.00',
      image: AppImages.img_shoes,
      // colors: [Colors.black, Colors.grey, Colors.brown],
    ),
    Product(
      name: 'Apple iPhone 12',
      price: '\$999.00',
      oldPrice: '\$1099.00',
      image: AppImages.img_phone,
      // colors: [Colors.black, Colors.blue, Colors.red],
    ),
    Product(
      name: 'Sony Headphones',
      price: '\$199.00',
      oldPrice: '\$250.00',
      image: AppImages.img_headphones,
      // colors: [Colors.brown],
    ),
  ];
}
