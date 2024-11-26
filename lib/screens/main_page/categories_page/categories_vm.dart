// import 'package:bai_9a/consts/app_path.dart';
// import 'package:bai_9a/models/entity/categories_model.dart';
//
// List<CategoriesModel> listCategories = [
//   CategoriesModel(
//     idCate: '1',
//     name: 'Electronics',
//     image: AppImages.img_electronics,
//   ),
//   CategoriesModel(
//     idCate: '2',
//     name: 'Fashion',
//     image: AppImages.img_fashion,
//   ),
//   CategoriesModel(
//     idCate: '3',
//     name: 'Furniture',
//     image: AppImages.img_furniture,
//   ),
//   CategoriesModel(
//     idCate: '4',
//     name: 'Industrial',
//     image: AppImages.img_industrial,
//   ),
//   CategoriesModel(
//     idCate: '5',
//     name: 'Home Decor',
//     image: AppImages.img_homeDecor,
//   ),
//   CategoriesModel(
//     idCate: '6',
//     name: 'Electronics',
//     image: AppImages.img_electronicsTV,
//   ),
//   CategoriesModel(
//     idCate: '7',
//     name: 'Health',
//     image: AppImages.img_health,
//   ),
//   CategoriesModel(
//     idCate: '8',
//     name: 'Construction & Real \n State',
//     image: AppImages.img_construction,
//   ),
//   CategoriesModel(
//     idCate: '9',
//     name: 'Fabrication Service',
//     image: AppImages.img_fabricationService,
//   ),
//   CategoriesModel(
//     idCate: '10',
//     name: 'Electrical Equipment',
//     image: AppImages.img_electricalEquipment,
//   ),
// ];

import 'package:flutter/foundation.dart';
import 'package:bai_9a/models/entity/categories_model.dart';
import 'package:bai_9a/consts/app_path.dart';


class CategoriesViewModel extends ChangeNotifier {
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

  // List<CategoriesModel> get categories => _categories;
  //
  // CategoriesModel getCategoryById(String id) {
  //   return _categories.firstWhere(
  //         (category) => category.idCate == id,
  //     orElse: () =>
  //         CategoriesModel(idCate: '0',
  //             name: 'Not Found',
  //             image: AppImages.img_dell), // Giá trị mặc định
  //   );
  // }
}
