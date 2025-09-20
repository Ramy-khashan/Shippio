import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';

class LocationAddressModel {
  final TextEditingController postaCode;
  final TextEditingController streetAddress;
  final TextEditingController city;
  final TextEditingController country;
  final TextEditingController address;
  final TextEditingController phoneNumber;

  LocationAddressModel({
    required this.postaCode,
    required this.streetAddress,
    required this.city,
    required this.country,
    required this.address,
    required this.phoneNumber,
  });
  factory LocationAddressModel.fromJson(Placemark placemarks) {
    return LocationAddressModel(
      postaCode: TextEditingController(text: placemarks.postalCode ?? ""),
      streetAddress: TextEditingController(text: placemarks.street ?? ""),
      city: TextEditingController(text: placemarks.locality ?? ""),
      country: TextEditingController(text: placemarks.country ?? ""),
      address: TextEditingController(text: placemarks.toJson().values.toString()),
      phoneNumber: TextEditingController(text: ""),
    );
  }
  Map<String, String> toJson() {
    return {
      "posta_code": postaCode.text,
      "street_address": streetAddress.text,
      "city": city.text,
      "country": country.text,
      "address": address.text,
      "phone_number": phoneNumber.text,
    };
  }
}
