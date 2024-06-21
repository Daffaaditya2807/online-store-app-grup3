class ProfileModel {
  final String uid;
  final String name;
  final String password;
  final String email;
  final String phone;
  final String alamat;

  ProfileModel(
      {required this.uid,
      required this.name,
      required this.password,
      required this.email,
      required this.phone,
      required this.alamat});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        uid: json['uid'],
        name: json['nama'],
        password: json['password'],
        email: json['email'],
        phone: json['phone'],
        alamat: json['alamat']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'nama': name,
      'password': password,
      'email': email,
      'phone': phone,
      'alamat': alamat
    };
  }
}
