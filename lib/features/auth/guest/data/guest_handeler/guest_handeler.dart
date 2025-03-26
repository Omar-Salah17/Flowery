import 'package:injectable/injectable.dart';

@singleton
class GuestManager {
  bool _isGuest = false;

  bool get isGuest => _isGuest;

  void setGuestMode(bool value) {
    _isGuest = value;
  }

  void reset() {
    _isGuest = false;
  }
}
