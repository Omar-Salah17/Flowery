import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/my_orders/domain/useCases/get_my_orders_use_case.dart';
import 'package:flowery/features/my_orders/presentation/view/widgets/orders_tab_widget.dart';
import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My orders"),
          bottom: TabBar(
            tabs: [Tab(text: "Active"), Tab(text: "Completed")],
            labelStyle: AppTextStyles.instance.textStyle16,
            labelColor: PalletsColors.mainColorBase,
            indicatorColor: PalletsColors.mainColorBase,
          ),
        ),
        body: SizedBox.expand(
          child: BlocProvider(create: (context) => getIt<MyOrdersCubit>()..featchMyOrders(),
            child: TabBarView(
              children: [OrdersTab(active: true), OrdersTab(active: false)],
            ),
          ),
        ),
      ),
    );
  }
}
