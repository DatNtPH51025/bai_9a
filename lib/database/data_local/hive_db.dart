import 'package:bai_9a/models/entity/product.dart';
import 'package:bai_9a/ultis/app_logger.dart';
import 'package:hive/hive.dart';

class HiveDB {
  HiveDB._();

  static HiveDB? _instance;

  static HiveDB get instance {
    return _instance ??= HiveDB._();
  }

  /// key hive
  static const String keyContacts = 'key_contacts';
  static const String keyProduct = 'key_product';

  // Future<void> addItemContacts(List<ContactsModel> listItem) async {
  //   var box = await Hive.openBox(keyContacts); // mo box ra lay du lieu
  //   box.put(keyContacts, listItem); // nhet no vao
  // }
  //
  // Future<List<ContactsModel>> getListContacts() async {
  //   try {
  //     final box = await Hive.openBox(keyContacts);
  //     List<dynamic>? list = [];
  //     list = await box.get(keyContacts); //  lay du lieu
  //     List<ContactsModel> listResult =
  //         List<ContactsModel>.from(list ?? []); // ep kieu
  //     return listResult;
  //   } catch (e) {
  //     logger.e(e);
  //     return [];
  //   }
  // }

  Future<void> addItemProduct(List<Product> listProduct) async {
    var box = await Hive.openBox(keyProduct); // mo box ra lay du lieu
    box.put(keyProduct, listProduct); // nhet no vao
  }

  Future<List<Product>> getListProduct() async {
    try {
      final box = await Hive.openBox(keyProduct);
      List<dynamic>? list = [];
      list = await box.get(keyProduct); //  lay du lieu
      List<Product> listResultProduct =
          List<Product>.from(list ?? []); // ep kieu
      return listResultProduct;
    } catch (e) {
      logger.e(e);
      return [];
    }
  }
}
