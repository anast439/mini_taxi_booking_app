import 'package:flutter/material.dart';
import 'package:mini_taxi_booking_app/utils/appSize.dart';

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
   title,
      style: TextStyle(
        fontSize: AppSizes.headingText(context),
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
