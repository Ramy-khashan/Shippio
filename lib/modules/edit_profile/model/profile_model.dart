class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phoneNumber;
  String? profileImage;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.profileImage,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      profileImage: json['profile_image'],
    );
  }
  toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "gender": gender,
      "phone_number": phoneNumber,
      "profile_image": profileImage,
    };
  }
}
