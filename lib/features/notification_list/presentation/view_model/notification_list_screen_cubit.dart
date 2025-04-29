import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery/core/utils/error_handler.dart';
import '../../domain/use_case/get_notification_use_case.dart';
import 'notification_list_screen_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationCubit(this.getNotificationsUseCase) : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    final result = await getNotificationsUseCase();
    result.fold(
          (failure) => emit(NotificationError(failure.errorMessage)),
          (data) => emit(NotificationLoaded(data)),
    );
  }
}
