
import 'package:injectable/injectable.dart';

@singleton
class GuestManager {
  static final GuestManager _instance = GuestManager._internal();
  bool _isGuest = false;

  factory GuestManager() {
    return _instance;
  }

  GuestManager._internal();

  bool get isGuest => _isGuest;

  void setGuestMode(bool value) {
    _isGuest = value;
  }

  void reset() {
    _isGuest = false;
  }
}
