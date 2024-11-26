import 'package:hive/hive.dart';

part 'contacts_model.g.dart';

@HiveType(typeId: 0)

/// trung id bao loi
class ContactsModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int numberCall;

  ContactsModel(this.name, this.numberCall);
}
