import 'package:flutter/material.dart';
import 'package:mini_taxi_booking_app/utils/app_sizes.dart';

class SubTitleText extends StatelessWidget {
  final String subTitle;
  const SubTitleText({
    super.key, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
     subTitle,
      style: TextStyle(
        fontSize: AppSizes.subTitleFont(context),
        color: Colors.black54,
      ),
    );
  }
}
