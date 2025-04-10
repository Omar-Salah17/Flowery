import 'package:flowery/features/occasion/presentation/view/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/helper/spacing.dart';

import 'package:flowery/features/home/presentation/widgets/product_item.dart';
import 'package:flowery/features/home/presentation/widgets/tab_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../occasion/presentation/view_model/cubits/occasion_cubit.dart';
import '../../domain/use_cases/get_all_occasions_use_case.dart';
import '../../domain/use_cases/get_product_by_occasion_useCase.dart';

class OccasionScreen extends StatefulWidget {
  const OccasionScreen({Key? key}) : super(key: key);

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen>
    with TickerProviderStateMixin {
  OccasionCubit occasionCubit = OccasionCubit(
    getAllOccasionsUseCase: getIt<GetAllOccasionsUseCase>(),
    getProductByOccasionUsecase: getIt<GetProductByOccasionUsecase>(),
  );
  @override
  void initState() {
    occasionCubit.getAllOccasions().then((_) {
      if (occasionCubit.occasions.isNotEmpty) {
        occasionCubit.tabController = TabController(
          length: occasionCubit.occasions.length,
          vsync: this,
        );
        final firstId = occasionCubit.occasions[0].id ?? '';
        occasionCubit.getProductByOccasion(occasionId: firstId);
        // Listen to tab changes and fetch products for the selected occasion
        occasionCubit.tabController.addListener(() {
          if (!occasionCubit.tabController.indexIsChanging) {
            final id =
                occasionCubit.occasions[occasionCubit.tabController.index].id;
            occasionCubit.getProductByOccasion(occasionId: id ?? '');
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    occasionCubit.tabController.dispose();
    occasionCubit.tabController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: AppbarTitle()),
      body: BlocProvider(
        create: (_) => occasionCubit..getAllOccasions(),
        child: BlocBuilder<OccasionCubit, OccasionState>(
          buildWhen:
              (previous, current) =>
                  previous != current && current is OccasionProductSuccess,
          builder: (context, state) {
            if (state is OccasionProductSuccess) {
              if (occasionCubit.tabController.indexIsChanging) {
                occasionCubit.getProductByOccasion(
                  occasionId:
                      occasionCubit
                          .occasions[occasionCubit.tabController.index]
                          .id ??
                      '',
                );
              }
              return DefaultTabController(
                length: occasionCubit.occasions.length,
                initialIndex: occasionCubit.tabController.index,
                child: Column(
                  children: [
                    TabWidget(
                      controller: occasionCubit.tabController,
                      tabs:
                          occasionCubit.occasions
                              .map((occasion) => Tab(text: occasion.name))
                              .toList(),
                    ),
                    verticalSpace(10),
                    Expanded(
                      child: GridView.builder(
                        itemCount: occasionCubit.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 17,
                              crossAxisSpacing: 17,
                              childAspectRatio: 0.7,
                            ),
                        itemBuilder: (context, index) {
                          return state.products.isEmpty?
                           const Center(child: Text("No products found")) : ProductItem(
                            products: occasionCubit.products[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is OccasionLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return const Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }
}