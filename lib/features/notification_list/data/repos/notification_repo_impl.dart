import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/notification_repo.dart';
import '../data_source/notification_data_source.dart';
import '../models/notification_response.dart';

@Injectable(as: NotificationRepo)
class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotificationRepoImpl({required this.notificationRemoteDataSource});

  @override
  Future<Either<Failure, NotificationResponse>> getNotifications() async {
    try {
      final response = await notificationRemoteDataSource.getNotifications();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('Error in NotificationRepoImpl.getNotifications: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
