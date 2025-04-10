import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/home/presentation/widgets/occasion_item.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeOccasionsView extends StatelessWidget {
  HomeOccasionsView({super.key,required this.occasions});
  List<Occasions> occasions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: occasions.length,
        itemBuilder: (context, index) {
          final item = occasions[index];
          return OccasionItem(occasion: item);
        },
      ),
    );
  }
}
