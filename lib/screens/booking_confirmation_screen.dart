import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_taxi_booking_app/utils/appSize.dart';
import 'package:mini_taxi_booking_app/widgets/appbar_widget.dart';
import 'package:mini_taxi_booking_app/widgets/primary_button.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String rideType;
  final int fare;
  final String pickup;
  final String destination;

  const BookingConfirmationScreen({
    super.key,
    required this.rideType,
    required this.fare,
    required this.pickup,
    required this.destination,
  });

  void _confirmBooking(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🎉 Your ride has been booked successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  IconData _getRideIcon(String type) {
    switch (type.toLowerCase()) {
      case 'bike':
        return Icons.pedal_bike_rounded;
      case 'car':
        return Icons.directions_car_rounded;
      case 'premium':
        return Icons.local_taxi_rounded;
      default:
        return Icons.directions_car;
    }
  }

  Color _getRideColor(String type) {
    switch (type.toLowerCase()) {
      case 'bike':
        return Colors.green.shade600;
      case 'car':
        return Colors.blue.shade600;
      case 'premium':
        return Colors.amber.shade700;
      default:
        return Colors.grey.shade400;
    }
  }

  Widget _infoRow(
    IconData icon,
    String label,
    String value,
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.grey.shade600,
          size: AppSizes.smallIcon(context),
        ),
        Gap(AppSizes.screenWidth(context) * 0.020),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: AppSizes.subTitleFont(context),
                ),
              ),
              Gap(2),
              Text(
                value,
                style: TextStyle(
                  fontSize: AppSizes.subTitleFont(context),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final rideColor = _getRideColor(rideType);

    return Scaffold(
      appBar: AppBarWidget(title: 'Booking Confirmation'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding(context),
          vertical: AppSizes.verticalPadding(context),
        ),
        child: Column(
          children: [
            /// --- Card Section --- ///
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: AppSizes.avtarRadius(context),
                    backgroundColor: rideColor.withValues(alpha: 0.1),
                    child: Icon(
                      _getRideIcon(rideType),
                      size: AppSizes.mediumIcon(context),
                      color: rideColor,
                    ),
                  ),
                  Gap(AppSizes.screenHeight(context) * 0.015),
                  Text(
                    rideType,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: rideColor,
                    ),
                  ),
                  const Divider(height: 30, thickness: 1),
                  _infoRow(Icons.my_location, "Pickup", pickup, context),
                  Gap(AppSizes.screenHeight(context) * 0.011),
                  _infoRow(
                    Icons.location_on,
                    "Destination",
                    destination,
                    context,
                  ),
                  Gap(AppSizes.screenHeight(context) * 0.011),
                  _infoRow(Icons.currency_rupee, "Fare", "PKR $fare", context),
                ],
              ),
            ),

            const Spacer(),

            /// --- Confirm Button --- ///
            PrimaryButton(
              text: "Confirm Booking",
              onPressed: () => _confirmBooking(context),
            ),
            Gap(AppSizes.screenHeight(context) * 0.020),
          ],
        ),
      ),
    );
  }
}
