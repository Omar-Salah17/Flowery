import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DriverFirebaseService {
  static FirebaseApp? _secondaryApp;
  static FirebaseFirestore? _driverFirestore;

  static Future<void> initialize() async {
    if (_secondaryApp == null) {
      _secondaryApp = await Firebase.initializeApp(
        name: 'driverApp',
        options: FirebaseOptions(
          apiKey: 'AIzaSyD-aiJTivVnithcUR2Ds-5FgH5W1nfznq8',
          appId: '1:391214810716:android:a5dbf00b0a96b5e188c899',
          messagingSenderId: '391214810716',
          projectId: 'traking-app-57b68',
          storageBucket: 'traking-app-57b68.firebasestorage.app',
        ),
      );
      _driverFirestore = FirebaseFirestore.instanceFor(app: _secondaryApp!);
    }
  }

  static FirebaseFirestore get firestore {
    if (_driverFirestore == null) {
      throw Exception('Driver Firebase not initialized');
    }
    return _driverFirestore!;
  }
}
