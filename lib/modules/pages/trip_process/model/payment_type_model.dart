import '../../../../core/constant/app_enums.dart';

class PaymentTypeModel {
  final String title;
  final String image;
  final PaymentTypeEnum paymentType;

  PaymentTypeModel({
    required this.title,
    required this.image,
    required this.paymentType,
  });
}
