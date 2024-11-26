class UsersProfile {
  UsersProfile({
    this.userFullName,
    this.passWord,
    this.email,
  });

  UsersProfile.fromJson(dynamic json) {
    userFullName = json['user_full_name'];
    passWord = json['pass_word'];
    email = json['email'];
  }

  String? userFullName;
  String? passWord;
  String? email;

  UsersProfile copyWith({
    String? userName,
    String? passWord,
    String? email,
  }) =>
      UsersProfile(
        userFullName: userName ?? this.userFullName,
        passWord: passWord ?? this.passWord,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_full_name'] = userFullName;
    map['pass_word'] = passWord;
    map['email'] = email;
    return map;
  }
}
