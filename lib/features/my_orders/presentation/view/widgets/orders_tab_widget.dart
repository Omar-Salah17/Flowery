import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_cubit.dart';
import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersTab extends StatelessWidget {
  final bool active;

  OrdersTab({required this.active, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        if (state is MyOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyOrdersSuccess) {
          final orders =
              active
                  ? state.orders.orders
                      ?.where((o) => o.isDelivered == false)
                      .toList()
                  : state.orders.orders
                      ?.where((o) => o.isDelivered == true)
                      .toList();

          if (orders == null || orders.isEmpty) {
            return Center(
              child: Text(active ? 'No active orders' : 'No completed orders'),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final orderItem = order.orderItems?.firstOrNull;
              final product = orderItem?.product;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.black), // black border
                ),
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade200,
                        child:
                            product?.imgCover != null
                                ? Image.network(
                                  product!.imgCover!,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) =>
                                          const Icon(Icons.image_not_supported),
                                )
                                : const Icon(Icons.image),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product?.title ?? "No product title",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text("EGP ${order.totalPrice ?? 0}"),
                            const SizedBox(height: 4),
                            Text(
                              active
                                  ? "Order #${order.orderNumber ?? ''}"
                                  : "Delivered on ${order.updatedAt!.toLocal().toString().split(' ').first ?? 'N/A'}",
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(active ? 'Track order' : 'Reorder'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is MyOrdersError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
