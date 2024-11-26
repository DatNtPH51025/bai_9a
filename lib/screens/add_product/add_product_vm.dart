import 'package:bai_9a/models/entity/hive_entity/contacts_model.dart';
import 'package:bai_9a/ultis/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class AddProductvm extends ChangeNotifier {
  String keyContact = 'keyContact';

  List<ContactsModel> list = [
    ContactsModel('dat', 0985767579),
    ContactsModel('dat', 0868236426),
    ContactsModel('dat', 0868236426),
    ContactsModel('dat', 0868236426),
    ContactsModel('dat', 0868236426),
  ];

  Future<void> addProjectDeep(List<ContactsModel> projects) async {
    var box = await Hive.openBox(keyContact);
    box.put(keyContact, projects);
  }

  Future<List<ContactsModel>?> getProjects() async {
    try {
      final box = await Hive.openBox(keyContact);
      List<dynamic>? list = [];
      list = await box.get(keyContact);
      List<ContactsModel>? listA = List<ContactsModel>.from(list ?? []);
      print(listA.length);
      return listA;
    } catch (e) {
      logger.e(e);
      return [];
    }
  }
}
