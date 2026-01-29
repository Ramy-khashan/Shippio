class VehiclesModel {
  int? id;
  String? title;
  String? fees;
  String? image;
  String? timeToDelivery;
  VehiclesModel({
    this.id,
    this.title,
    this.fees,
    this.timeToDelivery,
    this.image,
  });
  factory VehiclesModel.factory(Map<String, dynamic> json) {
    return VehiclesModel(
      id: json['id'],
      title: json['title'],
      fees: json['fees'],
      timeToDelivery: json['timeToDelivery'],
      image: json['image'],
    );
  }
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'fees': fees,
      'timeToDelivery': timeToDelivery,
      'image': image,
    };
  }
}
