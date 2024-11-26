import 'package:bai_9a/models/entity/users_profile.dart';

class DataGlobal {
  DataGlobal._();

  static DataGlobal? _instance;

  static DataGlobal get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = DataGlobal._();
      return _instance!;
    }
  }

  UsersProfile? usersProfile;
}
