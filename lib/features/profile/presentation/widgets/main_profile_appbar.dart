import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/di.dart';
import '../../../notification_list/presentation/view_model/notification_list_screen_cubit.dart';
import '../../../notification_list/presentation/view_model/notification_list_screen_state.dart';

class MainProfileAppBar extends StatelessWidget {
  const MainProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotificationCubit>()..fetchNotifications(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          int count = 0;
          if (state is NotificationLoaded) {
            count = state.response.notifications?.length ?? 0;
          }

          return AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                SvgPicture.asset("assets/images/Flower.svg"),
                Text(
                  "Flowery",
                  style: AppTextStyles.instance.textStyle20Fell.copyWith(
                    color: PalletsColors.mainColorBase,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.notificationListScreen);
                  },
                  child: Badge(
                    isLabelVisible: count > 0,
                    label: Text('$count'),
                    child: SvgPicture.asset('assets/images/notification.svg'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

