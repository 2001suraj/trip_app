class UserInfo {
  String name;
  String email;
  String bod;
  UserInfo({
    required this.name,
    required this.email,
    required this.bod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'bod': bod,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] as String,
      email: map['email'] as String,
      bod: map['bod'] as String,
    );
  }
}