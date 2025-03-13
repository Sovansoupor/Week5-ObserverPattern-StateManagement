
import '../../../Exercise1/model/ride/locations.dart';
import '../user/user.dart';

enum RideStatus {
  created,
  published,
  ongoing,
  finished;
}

///
/// This model describes a  Ride.
///
class Ride {
  final Location departureLocation;
  final DateTime departureDate;

  final Location arrivalLocation;
  final DateTime arrivalDateTime;

  final User driver;
  final int availableSeats;
  final double pricePerSeat;
  // final RidesFilter? filter;

  RideStatus status = RideStatus.created;

  final List<User> passengers = [];

  Ride({
    required this.departureLocation,
    required this.departureDate,
    required this.arrivalLocation,
    required this.arrivalDateTime,
    required this.driver,
    required this.availableSeats,
    required this.pricePerSeat,
    // this.filter, required bool acceptPets,
  });

  void addPassenger(User passenger) {
    passengers.add(passenger);
  }

  int get remainingSeats => availableSeats - passengers.length;

  get acceptsPets => null;

  // @override
  // String toString() {
  //   return 'Ride from $departureLocation at ${DateTimeUtils.formatDateTime(departureDate)} '
  //       'to $arrivalLocation arriving at ${DateTimeUtils.formatDateTime(arrivalDateTime)}, '
  //       'Driver: $driver, Seats: $availableSeats, Price: \$${pricePerSeat.toStringAsFixed(2)}';
  // }
}
