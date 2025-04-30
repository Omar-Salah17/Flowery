// import 'package:flowery/features/my_orders/presentation/view/widgets/orders_tab_widget.dart';
// import 'package:flutter/material.dart';

// class MyOrdersPage extends StatefulWidget {
//   const MyOrdersPage({super.key});

//   @override
//   State<MyOrdersPage> createState() => _MyOrdersPageState();
// }

// class _MyOrdersPageState extends State<MyOrdersPage> {
//   bool showActive = true;

//   void toggleTab(bool isActive) {
//     setState(() {
//       showActive = isActive;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final activeColor = Colors.pink;
//     final inactiveColor = Colors.grey.shade300;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Orders'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => toggleTab(true),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: showActive ? activeColor : inactiveColor,
//                       foregroundColor: showActive ? Colors.white : Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text('Active'),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => toggleTab(false),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: showActive ? inactiveColor : activeColor,
//                       foregroundColor: showActive ? Colors.black : Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text('Completed'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Expanded(child: OrdersTab(active: showActive)),
//         ],
//       ),
//     );
//   }
// }
