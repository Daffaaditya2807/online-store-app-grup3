class ProfileModel {
  final String uid;
  final String name;
  final String password;
  final String email;
  final String phone;

  ProfileModel(
      {required this.uid,
      required this.name,
      required this.password,
      required this.email,
      required this.phone});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        uid: json['uid'],
        name: json['nama'],
        password: json['password'],
        email: json['email'],
        phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'nama': name,
      'password': password,
      'email': email,
      'phone': phone,
    };
  }
}
