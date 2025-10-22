import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_taxi_booking_app/screens/available_rides_screen.dart';
import 'package:mini_taxi_booking_app/utils/app_sizes.dart';
import 'package:mini_taxi_booking_app/widgets/appbar_widget.dart';
import 'package:mini_taxi_booking_app/widgets/heading_text.dart';
import 'package:mini_taxi_booking_app/widgets/primary_button.dart';
import 'package:mini_taxi_booking_app/widgets/sub_title.dart';
import 'package:mini_taxi_booking_app/widgets/text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pickupController = TextEditingController();
  final _destinationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _findRide() {
    if (_formKey.currentState!.validate()) {
      final pickup = _pickupController.text.trim();
      final destination = _destinationController.text.trim();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AvailableRidesScreen(pickup: pickup, destination: destination),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Mini Taxi Booking'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding(context),
            vertical: AppSizes.verticalPadding(context),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- Heading --- ///
                HeadingText(title: "Book your ride easily"),
                Gap(AppSizes.screenHeight(context) * 0.01),
                SubTitleText(
                  subTitle: "Enter your pickup and destination below",
                ),
                Gap(AppSizes.screenHeight(context) * 0.04),

                /// --- Car Icon --- ///
                Center(
                  child: CircleAvatar(
                    radius: AppSizes.avtarRadius(context) * 2,

                    child: Icon(
                      Icons.local_taxi_rounded,
                      size: AppSizes.smallIcon(context) * 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap(AppSizes.screenHeight(context) * 0.05),

                /// --- Pickup Field --- ///
                TextFieldWidget(
                  controller: _pickupController,
                  labelText: 'Pickup Location',
                  prefixIcon: Icons.location_on,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pickup location';
                    }
                    return null;
                  },
                ),
                Gap(AppSizes.screenHeight(context) * 0.025),

                /// --- Destination Field --- ///
                TextFieldWidget(
                  controller: _destinationController,
                  labelText: 'Destination',
                  prefixIcon: Icons.flag_rounded,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter destination';
                    }
                    if (value.trim() == _pickupController.text.trim()) {
                      return 'Pickup and Destination cannot be the same';
                    }
                    return null;
                  },
                ),
                Gap(AppSizes.screenHeight(context) * 0.05),

                /// --- Find Ride Button --- ///
                PrimaryButton(
                  text: 'Find Ride',
                  icon: Icons.search,
                  onPressed: _findRide,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
