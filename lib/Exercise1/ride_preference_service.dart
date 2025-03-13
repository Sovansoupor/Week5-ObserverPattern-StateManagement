
import 'model/ride_pref/ride_pref.dart';
import 'ride_preference_listener.dart';

class RidePreferencesService {
  RidePreference _currentPreference;
  final List<RidePreferencesListener> _listeners = [];

  RidePreferencesService(this._currentPreference);


  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(_currentPreference);
    }
  }

  void updatePreference(RidePreference newPreference) {
    _currentPreference = newPreference;
    notifyListeners();
  }

  // Provides a getter to access the current preference
  RidePreference get currentPreference => _currentPreference;
}