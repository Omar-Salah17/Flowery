import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/home/domain/use_case/best_seller_usecase.dart';
import 'package:flowery/features/home/presentation/view%20model/best_seller_status.dart'
    show
        BestSellerFailure,
        BestSellerLoading,
        BestSellerState,
        BestSellerSuccess;
import 'package:flowery/features/home/presentation/view%20model/bset_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              BestSellerCubit(getIt.get<Bestsellerusecase>())
                ..getBestSellersData(),
      child: BlocBuilder<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
          if (state is BestSellerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BestSellerSuccess) {
            return SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.bestSellers.length,
                itemBuilder: (context, index) {
                  final item = state.bestSellers[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 130.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              height: 160.h,
                              width: 140.w,
                              fit: BoxFit.cover,
                              imageUrl: item.imgCover!,
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
                              item.title!,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.instance.textStyle12
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(12, 16, 21, 1),
                                  ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "${item.price} EGP",
                              style: AppTextStyles.instance.textStyle14
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(12, 16, 21, 1),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is BestSellerFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
