// import 'package:flowery/core/utils/app_text_styles.dart';
// import 'package:flowery/core/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomErrorWidget extends StatelessWidget {
//   const CustomErrorWidget({
//     super.key,
//     this.title,
//     this.content,
//     this.onPressed,
//   });
//   final String? title;
//   final String? content;
//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//       shadowColor: PalletsColors.mainColorBase,
//       backgroundColor: PalletsColors.white50,
//       elevation: 10.r,
//       title: Text(
//         title ?? "",
//         style: AppTextStyles.instance.textStyle16,
//         // .copyWith(color: AppColors.kPrimaryColor),
//       ),
//       content: Text(
//         content ?? '',
//         style: AppTextStyles.instance.textStyle16,
//         // .copyWith(color: AppColors.kPrimaryColor),
//       ),
//       actions: [
//         TextButton(
//           onPressed: onPressed,
//           child: Text(
//             'Ok',
//             style: AppTextStyles.instance.textStyle14.copyWith(
//               color: PalletsColors.mainColorBase,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
