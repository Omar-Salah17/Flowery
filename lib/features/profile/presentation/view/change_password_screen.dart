import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/domain/use_case/change_password_use_case.dart';
import 'package:flowery/features/profile/presentation/view/widgets/change_password_screen_body.dart';
import 'package:flowery/features/profile/presentation/view_model/change_pass_cubit/change_password_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get<ChangePasswordUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(LocaleKeys.resetPassword.tr()),
          titleSpacing: 0,
        ),
        body: ChangePasswordScreenBody(),
      ),
    );
  }
}
