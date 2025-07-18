import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/notification_list/data/models/notification_response.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/di/di.dart';
import '../view_model/notification_list_screen_cubit.dart';
import '../view_model/notification_list_screen_state.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotificationCubit>()..fetchNotifications(),
      child: Scaffold(
        appBar: AppBar(
          title:  Text('${LocaleKeys.notification.tr()}'),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: CircularProgressIndicator(color: PalletsColors.mainColorBase));
            } else if (state is NotificationError) {
              return Center(child: Text(state.message));
            } else if (state is NotificationLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.response.notifications!.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final notification = state.response.notifications![index];
                  return NotificationItem(notification: notification);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/images/notification.svg'),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title??"",
                style: AppTextStyles.instance.textStyle16.copyWith(color: PalletsColors.blackBase,fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                notification.body?? "",
                style: AppTextStyles.instance.textStyle16.copyWith(color: PalletsColors.gray,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
