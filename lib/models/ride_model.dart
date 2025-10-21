class RideModel {
  final String type;
  final int fare;
  final String time;

  RideModel({required this.type, required this.fare, required this.time});
}

class RideModelList {
  static List<RideModel> rides = [
    RideModel(type: 'Bike', fare: 200, time: '8 mins'),
    RideModel(type: 'Car', fare: 500, time: '5 mins'),
    RideModel(type: 'Premium', fare: 800, time: '3 mins'),
  ];
}
