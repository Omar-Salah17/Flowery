import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';

class OccasionItem extends StatelessWidget {
  Occasions occasion;
  OccasionItem({super.key, required this.occasion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.occasionScreen);
        },
        child: SizedBox(
          width: 130.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 160.h,
                width: 140.w,
                fit: BoxFit.cover,
                imageUrl:
                    "https://flower.elevateegy.com/uploads/${occasion.image}",
                progressIndicatorBuilder:
                    (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        color: PalletsColors.mainColorBase,
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 8.h),
              Text(
                occasion.name!,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.instance.textStyle12.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(12, 16, 21, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
