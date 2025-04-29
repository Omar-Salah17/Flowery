import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_cubit.dart';
import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersTab extends StatelessWidget {
  final bool active;

  const OrdersTab({required this.active});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        if (state is MyOrdersLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MyOrdersSuccess) {
          final orders =
              active
                  ? state.orders
                      .where((o) => o.product?.state == "active")
                      .toList()
                  : state.orders
                      .where((o) => o.product?.state == "completed")
                      .toList();

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                child: ListTile(
                  leading: Image.network(order.product?.imgCover ?? ""),
                  title: Text(order.product?.title ?? ''),
                  subtitle:
                      active
                          ? Text(
                            "Order number# ${order.product?.createdAt ?? ""}",
                          )
                          : Text(
                            "Delivered on ${order.product?.createdAt ?? ""}",
                          ),
                  trailing: ElevatedButton(
                    child: Text(active ? "Track order" : "Reorder"),
                    onPressed: () {},
                  ),
                ),
              );
            },
          );
        } else if (state is MyOrdersError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
