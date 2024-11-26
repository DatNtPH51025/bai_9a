import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/models/entity/product_model.dart';
import 'package:flutter/cupertino.dart';

class ListProductVm extends ChangeNotifier {
  late String idCate;
  late String title;

  ListProductVm(this.idCate, this.title);

  List<ProductModel> listPro = [];

  List<ProductModel> listProduct = [
    ProductModel(
      id: '1',
      idCate: '1',
      name: 'Laptops',
      image: AppImages.img_dell,
    ),
    ProductModel(
      id: '2',
      idCate: '1',
      name: 'Mobile phones',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '3',
      idCate: '1',
      name: 'Headphones',
      image: AppImages.img_headphones,
    ),
    ProductModel(
      id: '4',
      idCate: '1',
      name: 'Smart Watches',
      image: AppImages.img_smartwatches,
    ),
    ProductModel(
      id: '5',
      idCate: '1',
      name: 'Mobile Cases',
      image: AppImages.img_mobilecases,
    ),
    ProductModel(
      id: '6',
      idCate: '1',
      name: 'Monitors',
      image: AppImages.img_monitors,
    ),
    ProductModel(
      id: '7',
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '8',
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '9',
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '10',
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '11',
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '12',
      idCate: '2',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '13',
      idCate: '3',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '14',
      idCate: '3',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '15',
      idCate: '3',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '16',
      idCate: '3',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '17',
      idCate: '3',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '18',
      idCate: '3',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '19',
      idCate: '4',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '20',
      idCate: '4',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '21',
      idCate: '4',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '22',
      idCate: '4',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '23',
      idCate: '4',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '24',
      idCate: '4',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '25',
      idCate: '5',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '26',
      idCate: '5',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '27',
      idCate: '5',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '28',
      idCate: '5',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '29',
      idCate: '5',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '30',
      idCate: '5',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '31',
      idCate: '6',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '32',
      idCate: '6',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '33',
      idCate: '6',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '34',
      idCate: '6',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '35',
      idCate: '6',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
    ProductModel(
      id: '36',
      idCate: '6',
      name: 'Fashion',
      image: AppImages.img_phone,
    ),
  ];

  // void findById(String id) {
  //   for (int i = 0; i < listProduct.length; i++) {
  //     if (listProduct[i].idCate == id) {
  //       listPro.add(listProduct[i]);
  //     }
  //   }
  //   notifyListeners();
  // }

  void findById() {
    listPro = listProduct.where((product) => product.idCate == idCate).toList();
    notifyListeners();
  }

  /// .where(...): cho phép bạn lọc danh sách.
  /// product.idCate == idCate: Điều kiện kiểm tra xem thuộc tính idCate của sản phẩm có bằng với idCate hiện tại không
}
