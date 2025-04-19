import 'package:flowery/features/address/data/models/logged_user_address_model.dart';

abstract class AdderssRemoteDataSource {
  Future< List<Addresses>?> getLoggedUserAddress();
}