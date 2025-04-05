class UsersProfile {
  UsersProfile({
    this.userFullName,
    this.passWord,
    this.email,
    this.role,
  });

  UsersProfile.fromJson(dynamic json) {
    userFullName = json['user_full_name'];
    passWord = json['pass_word'];
    email = json['email'];
    role = parseRole(json['role']);
  }

  String? userFullName;
  String? passWord;
  String? email;
  UserRole? role;

  UsersProfile copyWith({
    String? userName,
    String? passWord,
    String? email,
    UserRole? role,
  }) =>
      UsersProfile(
        userFullName: userName ?? this.userFullName,
        passWord: passWord ?? this.passWord,
        email: email ?? this.email,
        role: role ?? this.role,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_full_name'] = userFullName;
    map['pass_word'] = passWord;
    map['email'] = email;
    map['role'] = roleToString(role);
    return map;
  }
}

enum UserRole { admin, user }

UserRole? parseRole(String? value) {
  switch (value) {
    case 'admin':
      return UserRole.admin;
    case 'user':
      return UserRole.user;
    default:
      return null;
  }
}

String roleToString(UserRole? role) {
  switch (role) {
    case UserRole.admin:
      return 'admin';
    case UserRole.user:
      return 'user';
    default:
      return '';
  }
}
