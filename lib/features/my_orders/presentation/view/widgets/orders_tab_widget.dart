import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_cubit.dart';
import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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


    

    // return
    // ListView.builder(
    //   itemCount: orders.length,
    // padding: const EdgeInsets.all(16),
    // itemBuilder: (context, index) {
    //   final order = orders[index];
    //   final product = order.orders?[index].orderItems?[index].product;

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 2,
//       // margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(12),
//         leading:
//         // product?.imgCover != null
//         Container(
//           width: 100,
//           height: 100,
//           color: Colors.amber,
//           child: Image.asset("assets/images/Image.png", fit: BoxFit.fill),
//         ),

//         // != null
//         //     ? ClipRRect(
//         //       borderRadius: BorderRadius.circular(8),
//         //       child:
//         //       //  Image.network(
//         //       //   product!.imgCover!,
//         //       Image.asset(
//         //         "assets/images/Image.png",
//         //         width: 60,
//         //         height: 60,
//         //         fit: BoxFit.cover,
//         //       ),
//         //     )
//         // : const Icon(Icons.image_not_supported),
//         title: Text(
//           // product?.title ?? 'Product',
//           "title",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text('EGP ${order.orders?[index].totalPrice ?? 0}'),
//             Text("egp"),
//             const SizedBox(height: 4),
//             active
//                 ? Expanded(
//                   child: Text(
//                     // 'Order number# ${order.orders?[index].orderNumber ?? ''}',
//                     "ordernum",
//                   ),
//                 )
//                 : Expanded(
//                   child: Text(
//                     // 'Delivered on ${DateFormat('dMMM yyyy').format(order.orders?[index].updatedAt ?? order.orders?[index].createdAt ?? DateTime.now())}',
//                     "delivered on",
//                   ),
//                 ),

//             // trailing:
//             ElevatedButton(
//               onPressed: () {
//                 // Add actual navigation or logic
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.pink,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: Text(active ? 'Track order' : 'Reorder'),
//             ),
//           ],
//         ),
//       ),
//     );
//     // },
//     //       );
//     //     } else if (state is MyOrdersError) {
//     //       return Center(child: Text(state.message));
//     //     } else {
//     //       return const SizedBox.shrink();
//     // }
//     // },
//     // );
//   }
// }
