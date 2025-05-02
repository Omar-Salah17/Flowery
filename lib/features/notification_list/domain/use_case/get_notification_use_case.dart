import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery/core/utils/error_handler.dart';

import '../../data/models/notification_response.dart';
import '../repos/notification_repo.dart';

@injectable
class GetNotificationsUseCase {
  final NotificationRepo notificationRepo;

  GetNotificationsUseCase(this.notificationRepo);

  Future<Either<Failure, NotificationResponse>> call() {
    return notificationRepo.getNotifications();
  }
}
