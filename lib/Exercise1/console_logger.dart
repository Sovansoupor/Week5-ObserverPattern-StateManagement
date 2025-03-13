
import 'model/ride_pref/ride_pref.dart';
import 'ride_preference_listener.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print('Preference changed to: $selectedPreference');
  }
}