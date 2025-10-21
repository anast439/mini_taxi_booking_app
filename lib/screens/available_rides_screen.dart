import 'package:flutter/material.dart';
import 'package:mini_taxi_booking_app/screens/booking_confirmation_screen.dart';
import 'package:mini_taxi_booking_app/utils/appSize.dart';
import 'package:mini_taxi_booking_app/utils/colors.dart';
import 'package:mini_taxi_booking_app/widgets/appbar_widget.dart';
import '../models/ride_model.dart';

class AvailableRidesScreen extends StatelessWidget {
  final String pickup;
  final String destination;

  const AvailableRidesScreen({
    super.key,
    required this.pickup,
    required this.destination,
  });

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

  @override
  Widget build(BuildContext context) {
    final ridesData = RideModelList.rides;

    return Scaffold(
      appBar: AppBarWidget(title: 'Available Rides'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding(context),
          vertical: AppSizes.verticalPadding(context),
        ),
        child: ListView.builder(
          itemCount: ridesData.length,
          itemBuilder: (context, index) {
            final ride = ridesData[index];
            final rideColor = _getRideColor(ride.type);

            return Container(
              margin: EdgeInsets.symmetric(
                vertical: AppSizes.screenHeight(context) * 0.012,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppSizes.screenWidth(context) * 0.04,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.screenWidth(context) * 0.04),
                child: Row(
                  children: [
                    /// --- Ride Icon --- ///
                    CircleAvatar(
                      radius: AppSizes.avtarRadius(context),
                      backgroundColor: rideColor.withValues(alpha: 0.1),
                      child: Icon(
                        _getRideIcon(ride.type),
                        size: AppSizes.smallIcon(context),
                        color: rideColor,
                      ),
                    ),
                    SizedBox(width: AppSizes.screenWidth(context) * 0.04),

                    /// --- Ride Info --- ///
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ride.type,
                            style: TextStyle(
                              fontSize: AppSizes.titleFont(context),
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.screenHeight(context) * 0.005,
                          ),
                          Text(
                            'Fare: PKR ${ride.fare}  •  ETA: ${ride.time}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: AppSizes.subTitleFont(context),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// --- Select Button --- //
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.buttonHorizontalPadding(context),
                          vertical: AppSizes.buttonVerticalPadding(context),
                        ),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSizes.screenWidth(context) * 0.03,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingConfirmationScreen(
                              rideType: ride.type,
                              fare: ride.fare,
                              pickup: pickup,
                              destination: destination,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Select',
                        style: TextStyle(
                          fontSize: AppSizes.subTitleFont(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
