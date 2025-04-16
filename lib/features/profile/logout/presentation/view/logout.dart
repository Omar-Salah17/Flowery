// import 'package:flowery/core/utils/app_text_styles.dart';
// import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
// import 'package:flowery/features/profile/logout/presentation/viewModel/logout_states.dart';
// import 'package:flowery/features/profile/logout/presentation/viewModel/logout_viewModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Logout extends StatelessWidget {
//   const Logout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LogoutViewModel,LogoutState>(
//       listener: (context, state) {
//         if (state is LogoutSuccessState) {
//           showSnackBar(context, "Logout Successfully");
//           print('Logout Success: ${state.message}');

//         }
//         if (state is LogoutFailureState) {
//           showErrorSnackBar(context, state.errorMessage);
//           print('Logout Failure: ${state.errorMessage}');
//         }
//       },
//         child: Padding(
//         padding: EdgeInsets.all(16).r,

//         child: Row(

//           children: [

//             Icon(
//                 Icons.logout
//             ),
//             Text("Logout",
//               style: AppTextStyles.instance.textStyle13,
//             ),
//             Spacer(),
//             InkWell(
//               onTap: (){
//                   context.read<LogoutViewModel>()
//                       .showLogoutConfirmationDialog(
//                       context,
//                     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdmOTExMzRhOTgzMmQ4MzU5ZGRmZTk4Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQ1MDA5MTV9.f_k5uSWb5b5TinYyIw58-6kA4vW9-Hv7JcA-3hupXsg"
//                   );
//               },

//               child: Icon(
//                   Icons.logout
//               ),

//             )
//           ],
//         ),
//       )

//     );
//         }


// }

