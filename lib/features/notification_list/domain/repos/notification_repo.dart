import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import '../../data/models/notification_response.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationResponse>> getNotifications();
}
