import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/profile/presentation/view/cubit/profile_cubit.dart';

import 'package:flowery/features/profile/presentation/widgets/main_profile_appbar.dart';
import 'package:flowery/features/profile/presentation/widgets/settings_tile.dart';
import 'package:flowery/features/profile/presentation/widgets/user_info_scetion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMainScreen extends StatefulWidget {
  ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: MainProfileAppBar(),
        ),
      ),
      body: Column(
        children: [
          verticalSpace(20.h),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: PalletsColors.mainColorBase,
                  ),
                );
              } else if (state is ProfileError) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppTextStyles.instance.textStyle18.copyWith(
                      color: Colors.red,
                    ),
                  ),
                );
              } else if (state is ProfileSucess) {
                return UserInfoScetion(user: state.user);
              }
              return Container();
            
            },
          ),
          SettingsTile(
            iconPath: 'assets/images/list.svg',
            title: 'My orders',
            onTap: () {
              // Navigate to My Orders
            },
          ),
          SettingsTile(
            iconPath: 'assets/images/location.svg',
            title: 'Saved address',
            onTap: () {
              // Navigate to Saved Address
            },
          ),
          verticalSpace(16),
          Divider(color: PalletsColors.white70, height: .5.h),
          verticalSpace(10),
          SettingsTile(
            icon: Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.pink,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: isSwitched,
              onChanged: (value) {
                isSwitched = value;
                setState(() {});
              },
            ),
            title: 'Notifications',
          ),
          verticalSpace(10),
          Divider(color: PalletsColors.white70, height: .5.h),
          verticalSpace(10),
          SettingsTile(
            title: 'Language',
            icon: Icon(Icons.translate),
            trailing: Text(
              'English',
              style: AppTextStyles.instance.textStyle13.copyWith(
                color: PalletsColors.mainColorBase,
              ),
            ),
            onTap: () {
              // Language bottom sheet
            },
          ),
          SettingsTile(
            title: "About us",
            onTap: () {
              // Navigate to About Us
            },
          ),
          SettingsTile(title: "Terms & Conditions", onTap: () {}),
          verticalSpace(10),
          Divider(color: PalletsColors.white70, height: .5.h),
          verticalSpace(10),
          SettingsTile(
            title: "Log out",
            onTap: () {
              // Log out action
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
