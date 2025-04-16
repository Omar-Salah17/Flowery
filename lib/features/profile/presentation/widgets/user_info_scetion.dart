// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';

class UserInfoScetion extends StatelessWidget {
  final UserData user;
  const UserInfoScetion({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            child:CachedNetworkImage(imageUrl: user.photo??'',
            errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          verticalSpace(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: AppTextStyles.instance.textStyle18.copyWith(
                  color: PalletsColors.black100,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle edit action
                },
                child: SvgPicture.asset('assets/images/pen.svg'),
              ),
            ],
          ),
          Text(
            user.email??'email',
            style: AppTextStyles.instance.textStyle18.copyWith(
              color: PalletsColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
