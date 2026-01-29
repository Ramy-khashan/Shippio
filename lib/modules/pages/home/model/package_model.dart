class PackageModel {
  int? id;
  String? name;
  String? image;
  String? hint;
  PackageModel({this.hint, this.id, this.image, this.name});
  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      hint: json['hint'],
    );
  }
}
