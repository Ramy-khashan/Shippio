import 'package:flutter/material.dart';
import '../../../core/components/image_item.dart';
import '../../../core/constant/app_colors.dart';
import '../../trip_process/model/payment_type_model.dart';

import '../../../core/constant/app_enums.dart';

class PaymentShape extends StatelessWidget {
  const PaymentShape({
    super.key,
    required this.payment,
    required this.onTap,
    required this.paymentType,
  });
  final PaymentTypeModel payment;
  final VoidCallback onTap;
  final PaymentTypeEnum paymentType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: payment.paymentType == paymentType
                ? AppColors.whiteColor
                : Colors.transparent,
          ),
        ),
        onTap: onTap,
        leading: Radio<PaymentTypeEnum>(
          value: payment.paymentType,
          activeColor: AppColors.whiteColor,
        ),
        title: Text(
          payment.title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        trailing: Container(
          margin: EdgeInsets.symmetric(vertical: 3),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ImageItem(
            payment.image,
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }
}
