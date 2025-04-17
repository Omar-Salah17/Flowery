// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';

import '../view/cubit/profile_cubit.dart';

class UserInfoScetion extends StatelessWidget {
  final UserData user;
  const UserInfoScetion({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(user.photo!,),
            radius: 50.r,
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
                onTap: () async {
                  await Navigator.pushNamed(context, RoutesName.editProfile, arguments: user);
                  context.read<ProfileCubit>().getUserData();

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
