import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/home/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flowery/features/home/domain/use_cases/get_product_by_occasion_useCase.dart';

import 'package:flowery/features/home/presentation/view/cubit/occasion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeOccasionsView extends StatelessWidget {
  const HomeOccasionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => OccasionCubit(
            getAllOccasionsUseCase: getIt.get<GetAllOccasionsUseCase>(),
            getProductByOccasionUsecase:
                getIt.get<GetProductByOccasionUsecase>(),
          )..getAllOccasions(),
      child: BlocBuilder<OccasionCubit, OccasionState>(
        builder: (context, state) {
          if (state is OccasionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OccasionSuccess) {
            final occasions = state.occasions;

            return SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: occasions.length,
                itemBuilder: (context, index) {
                  final occasion = occasions[index];
                  final imageUrl =
                      "https://flower.elevateegy.com/uploads/${occasion.image}";
                  log(imageUrl);
                  log(occasion.image!);
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      width: 130.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            height: 160.h,
                            width: 140.w,
                            fit: BoxFit.cover,
                            imageUrl: imageUrl,
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                    color: PalletsColors.mainColorBase,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            occasion.name!,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.instance.textStyle14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(12, 16, 21, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is OccasionError) {
            return Center(child: Text(state.error));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
