import 'ride_preference_service.dart';
import 'model/ride/locations.dart';
import 'console_logger.dart';
import 'model/ride_pref/ride_pref.dart';

void main() {
  RidePreference initialPreference = RidePreference(
    departure: Location(name: 'Phnom Penh', country: Country.cambodia),
    departureDate: DateTime.now(),
    arrival: Location(name: 'Siem Reap', country: Country.cambodia),
    requestedSeats: 2,
  );

  RidePreferencesService service = RidePreferencesService(initialPreference);
  ConsoleLogger logger = ConsoleLogger();

  service.addListener(logger);

  RidePreference newPreference1 = RidePreference(
    departure: Location(name: 'Paris', country: Country.france),
    departureDate: DateTime.now().add(Duration(days: 1)),
    arrival: Location(name: 'Lyon', country: Country.france),
    requestedSeats: 3,
  );

  RidePreference newPreference2 = RidePreference(
    departure: Location(name: 'London', country: Country.uk),
    departureDate: DateTime.now().add(Duration(days: 2)),
    arrival: Location(name: 'Manchester', country: Country.uk),
    requestedSeats: 4,
  );

  service.updatePreference(newPreference1);
  service.updatePreference(newPreference2);
}