// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forgetPassword/data/dataSource/forget_password_remot_data_source.dart'
    as _i129;
import '../../features/auth/forgetPassword/data/dataSource/forget_password_remote_data_source_impl.dart'
    as _i177;
import '../../features/auth/forgetPassword/data/repos/forget_password_repo_impl.dart'
    as _i176;
import '../../features/auth/forgetPassword/domain/repos/forget_password_repo.dart'
    as _i497;
import '../../features/auth/forgetPassword/domain/use_cases/forget_password_use_case.dart'
    as _i147;
import '../../features/auth/forgetPassword/domain/use_cases/verify_code_use_case.dart'
    as _i356;
import '../apiManger/api_manager.dart' as _i29;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i29.ApiManager>(() => _i29.ApiManager());
    gh.factory<_i129.ForgetPasswordRemoteDataSource>(
      () => _i177.ForgetPasswordRemoteDataSourceImpl(
        apiManager: gh<_i29.ApiManager>(),
      ),
    );
    gh.factory<_i497.ForgetPasswordRepo>(
      () => _i176.ForgetPasswordRepoImpl(
        forgetPasswordRemoteDataSource:
            gh<_i129.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i147.ForgetPasswordUseCase>(
      () => _i147.ForgetPasswordUseCase(
        forgetPasswordRepo: gh<_i497.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i356.VerifyCodeUseCase>(
      () => _i356.VerifyCodeUseCase(
        forgetPasswordRepo: gh<_i497.ForgetPasswordRepo>(),
      ),
    );
    return this;
  }
}
