import 'package:injectable/injectable.dart';

import '../../../../core/api_manger/api_service.dart';
import '../models/notification_response.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationResponse> getNotifications();
}

@Injectable(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiService _apiService;

  NotificationRemoteDataSourceImpl(this._apiService);

  @override
  Future<NotificationResponse> getNotifications() {
    return _apiService.getNotifications();
  }
}
