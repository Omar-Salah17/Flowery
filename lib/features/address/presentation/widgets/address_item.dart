import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressItem extends StatelessWidget {
  Addresses address;
  AddressItem({required this.address, super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: PalletsColors.white70.withOpacity(0.2), ),
        borderRadius: BorderRadius.circular(10.r),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/location.svg'),
              horizontalSpace(5.w),
              Text(address.city??'', style: AppTextStyles.instance.textStyle16),
              Spacer(),
              Image.asset('assets/images/delete.png'),
              horizontalSpace(5.w),
              SvgPicture.asset('assets/images/edit.svg'),
            ],
          ),
          verticalSpace(10.h),
          Text(address.street??'',
          style: AppTextStyles.instance.textStyle13.copyWith(
            color: PalletsColors.gray,
          ),
          )
        ],
      ),
    );
  }
}
