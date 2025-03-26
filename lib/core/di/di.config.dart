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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i162.RegisterRepositoryDataSourceContract>(
      () => _i80.RegisterDataSourceImpl(),
    );
    gh.factory<_i251.RegisterRepositoryContracr>(
      () => _i518.RegisterRepositoryImpl(
        repositoryDataSourceContract:
            gh<_i162.RegisterRepositoryDataSourceContract>(),
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
