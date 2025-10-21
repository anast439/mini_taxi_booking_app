import 'package:flutter/material.dart';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Taxi Booking'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldWidget(
                controller: _pickupController,
                labelText: 'Pickup Location',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pickup location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFieldWidget(
                controller: _destinationController,
                labelText: 'Destination',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter destination';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _findRide,
                child: const Text('Find Ride'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
