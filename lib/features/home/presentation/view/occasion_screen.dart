// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/home/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flowery/features/home/presentation/view/cubit/occasion_cubit.dart';
import 'package:flowery/features/home/presentation/widgets/appbar_title.dart';
import 'package:flowery/features/home/presentation/widgets/product_item.dart';
import 'package:flowery/features/home/presentation/widgets/tab_widget.dart';

class OccasionScreen extends StatefulWidget {
  OccasionScreen({Key? key}) : super(key: key);

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}
class _OccasionScreenState extends State<OccasionScreen>
    with TickerProviderStateMixin {
   OccasionCubit occasionCubit= OccasionCubit(
    getAllOccasionsUseCase: getIt<GetAllOccasionsUseCase>(),);
  @override
  void dispose() {
    occasionCubit.tabController.dispose();
    
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: PalletsColors.white10,
        title: const AppbarTitle(),
      ),
      body: BlocProvider(
        create: (context) => occasionCubit..getAllOccasions(),
        child: DefaultTabController(
          length: occasionCubit.occasions.length,
          initialIndex: 0,
          child: Column(
            children: [
              BlocBuilder<OccasionCubit, OccasionState>(
                builder: (context, state) {
                  if (state is OccasionSuccess) {
                    occasionCubit.tabController = TabController(
                      length: state.occasions.length,
                      vsync: this,
                    );
                    return TabWidget(
                      controller: occasionCubit.tabController,
                      tabs:
                          state.occasions
                              .map((occasion) => Tab(text: occasion.name))
                              .toList(),
                      onTap: (index) {
                        occasionCubit.tabController.animateTo(index);
                      },
                    );
                  } else {
                    return Container(); 
                  }
                },
              ),
              verticalSpace(10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 17,
                    crossAxisSpacing: 17,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => ProductItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
