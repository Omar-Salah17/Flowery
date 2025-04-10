
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';


class OccasionItem extends StatelessWidget {
  Occasions occasion;
  OccasionItem({Key? key, required this.occasion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 163.w,
      height: 250.h,
      decoration: BoxDecoration(
        border: Border.all(color: PalletsColors.gray, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              width: 147.w,
              height: 131.h,
              imageUrl: occasion.image??'',
              progressIndicatorBuilder: (context, url, progress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                      color: PalletsColors.mainColorBase,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            verticalSpace(10),
            Text(
              occasion.name??'',
              style: AppTextStyles.instance.textStyle12.copyWith(
                color: PalletsColors.blackBase,
              ),
            ),
            // verticalSpace(10),

            verticalSpace(10),
            SizedBox(
              width: 147.w,
              height: 35.h,


              ),
          ],
        ),
      ),
    );
  }
}
