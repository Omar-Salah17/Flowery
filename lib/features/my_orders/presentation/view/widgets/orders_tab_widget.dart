import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_cubit.dart';
import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrdersTab extends StatelessWidget {
  final bool active;

  const OrdersTab({required this.active, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        if (state is MyOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyOrdersSuccess) {
          final orders =
              state.orders
                  ?.where(
                    (order) =>
                        active
                            ? !(order.orders?.first.isDelivered ?? false)
                            : (order.orders?.first.isDelivered ?? false),
                  )
                  .toList();

          if (orders == null || orders.isEmpty) {
            return Center(
              child: Text(active ? 'No active orders' : 'No completed orders'),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final order = orders[index];
              final product = order.orders?[index].orderItems?[index].product;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading:
                      product?.imgCover != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product!.imgCover!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          )
                          : const Icon(Icons.image_not_supported),
                  title: Text(
                    product?.title ?? 'Product',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('EGP ${order.orders?[index].totalPrice ?? 0}'),
                      const SizedBox(height: 4),
                      active
                          ? Text(
                            'Order number# ${order.orders?[index].orderNumber ?? ''}',
                          )
                          : Text(
                            'Delivered on ${DateFormat('dMMM yyyy').format(order.orders?[index].updatedAt ?? order.orders?[index].createdAt ?? DateTime.now())}',
                          ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Add actual navigation or logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(active ? 'Track order' : 'Reorder'),
                  ),
                ),
              );
            },
          );
        } else if (state is MyOrdersError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
