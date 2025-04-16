
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:bloc/bloc.dart';

// import '../../domain/use_cases/logout_use_case.dart';
// import 'logout_states.dart';


// @injectable
// class LogoutViewModel extends Cubit<LogoutState>{

//   LogoutUseCase logoutUseCase;
//   LogoutViewModel(this.logoutUseCase) : super(LogoutInitState());


//   Future<void> userLogout()async{
//     try{
//       var result =await logoutUseCase.call();
//       result.fold(
//             (err) {
//           emit(LogoutFailureState(err.errorMessage));
//         }
//         ,
//             (message) {
//           emit(LogoutSuccessState(message));

//         },);
//     }catch(e){
//       //custom error for jwt malformed when we get the Saved Token we will delete it
//       //And Remove it
//       emit(LogoutFailureState("Session Expired, Logging out!"));
//     }



//   }
//    Future<void> showLogoutConfirmationDialog(BuildContext context,String token) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // User must tap button to close dialog
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           title: Text('Confirm Logout'),
//           content: Text('Are you sure you want to logout?'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(dialogContext).pop(); // Close the dialog
//               },
//             ),
//             TextButton(
//               child: Text('Logout'),
//               onPressed: () {
//                 Navigator.of(dialogContext).pop(); // Close the dialog
//                 // Call the logout function with proper error handling
//                 userLogout().catchError((
//                     error) {
//                   print('Error during logout: $error');
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

// }