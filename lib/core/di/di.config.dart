// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
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
import '../../features/auth/forgetPassword/domain/use_cases/reset_password_use_case.dart'
    as _i403;
import '../../features/auth/forgetPassword/domain/use_cases/verify_code_use_case.dart'
    as _i356;
import '../../features/auth/guest/data/guest_handeler/guest_handeler.dart'
    as _i646;
import '../../features/auth/register/data/repository/data_source_impl/remote/register_data_source_impl.dart'
    as _i80;
import '../../features/auth/register/data/repository/register_repository_impl.dart'
    as _i518;
import '../../features/auth/register/domain/repository/contract_repos/register_repository_contracr.dart'
    as _i251;
import '../../features/auth/register/domain/repository/data_source_contract/remote/register_repository_data_source_contracr.dart'
    as _i162;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
import '../../features/home/data/DataSource/CategoriesDataSource.dart' as _i359;
import '../../features/home/data/DataSource/CategoriesDataSourceImpl.dart'
    as _i813;
import '../../features/home/data/repository/CategoriesRepoImpl.dart' as _i660;
import '../../features/home/domain/repository/CategoriesRepo.dart' as _i298;
import '../../features/home/domain/use_case/GetCategoriesUseCase.dart'
    as _i1057;
import '../../features/home/presentation/viewModel/HomeCategoriesViewModel.dart'
    as _i195;
import '../apiManger/api_manager.dart' as _i29;
import '../apiManger/apiService.dart' as _i171;
import '../apiManger/dio_module.dart' as _i304;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i29.ApiManager>(() => _i29.ApiManager());
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i646.GuestManager>(() => _i646.GuestManager());
    gh.factory<_i359.CategoriesDataSource>(
      () => _i813.CategoriesDataSourceImpl(),
    );
    gh.factory<_i162.RegisterRepositoryDataSourceContract>(
      () => _i80.RegisterDataSourceImpl(),
    );
    gh.factory<_i251.RegisterRepositoryContracr>(
      () => _i518.RegisterRepositoryImpl(
        repositoryDataSourceContract:
            gh<_i162.RegisterRepositoryDataSourceContract>(),
      ),
    );
    gh.factory<_i298.CategoriesRepo>(
      () => _i660.CategoriesRepoImpl(gh<_i359.CategoriesDataSource>()),
    );
    gh.factory<_i1057.GetCategoriesUseCase>(
      () => _i1057.GetCategoriesUseCase(gh<_i298.CategoriesRepo>()),
    );
    gh.factory<_i129.ForgetPasswordRemoteDataSource>(
      () => _i177.ForgetPasswordRemoteDataSourceImpl(
        apiManager: gh<_i29.ApiManager>(),
      ),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i361.LogInterceptor>()),
    );
    gh.factory<_i195.HomeCategoriesViewModel>(
      () => _i195.HomeCategoriesViewModel(gh<_i1057.GetCategoriesUseCase>()),
    );
    gh.singleton<_i171.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
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
    gh.factory<_i403.ResetPasswordUseCase>(
      () => _i403.ResetPasswordUseCase(
        forgetPasswordRepo: gh<_i497.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i356.VerifyCodeUseCase>(
      () => _i356.VerifyCodeUseCase(
        forgetPasswordRepo: gh<_i497.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(
        registerRepositoryContracr: gh<_i251.RegisterRepositoryContracr>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i304.DioModule {}
