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
import '../../features/auth/login/data/dataSources/login_remote_data_source.dart'
    as _i577;
import '../../features/auth/login/data/dataSources/login_remote_data_source_imp.dart'
    as _i194;
import '../../features/auth/login/data/repo/login_repo_imp.dart' as _i21;
import '../../features/auth/login/domain/repo/login_repo.dart' as _i632;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i334;
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
import '../../features/best_seller/data/data_source/best_seller_data_source.dart'
    as _i312;
import '../../features/best_seller/data/data_source/best_seller_data_source_impl.dart'
    as _i158;
import '../../features/best_seller/data/repos/best_seller_repo_impl.dart'
    as _i12;
import '../../features/best_seller/domain/repos/best_seller_repo.dart' as _i629;
import '../../features/best_seller/domain/use_case/get_best_seller_use_case.dart'
    as _i461;
import '../../features/best_seller/presentation/view_model/cubits/best_seller_cubit.dart'
    as _i717;
import '../../features/cart/data/data%20sources/cart_remote_data_source.dart'
    as _i569;
import '../../features/cart/data/data%20sources/cart_remote_data_sourcse_impl.dart'
    as _i373;
import '../../features/cart/data/repos/cart_repo_impl.dart' as _i806;
import '../../features/cart/domain/repos/cart_repo.dart' as _i123;
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart' as _i659;
import '../../features/cart/domain/usecases/clear_cart_usecase.dart' as _i240;
import '../../features/cart/domain/usecases/delete_cart_item_usecase.dart'
    as _i320;
import '../../features/cart/domain/usecases/get_user_cart_usecase.dart'
    as _i691;
import '../../features/cart/domain/usecases/update_product_quantity_use_case.dart'
    as _i412;
import '../../features/cart/presentation/view%20model/cubit/cart_cubit.dart'
    as _i1069;
import '../../features/categories/data/data_source/categories_screen_remote_data_source.dart'
    as _i469;
import '../../features/categories/data/data_source/categories_screen_remote_data_source_impl.dart'
    as _i666;
import '../../features/categories/data/repos/categories_screen_repo_impl.dart'
    as _i750;
import '../../features/categories/domain/repos/categories_screen_repo.dart'
    as _i826;
import '../../features/categories/domain/use_case/get_all_categories_use_case.dart'
    as _i595;
import '../../features/categories/domain/use_case/get_products_by_category_use_case.dart'
    as _i86;
import '../../features/home/presentation/viewModel/home_view_model/home_cubit.dart'
    as _i109;
import '../../features/occasion/data/repos/occasion_remote_data_source_impl.dart'
    as _i61;
import '../../features/occasion/data/repos/occasion_repository_impl.dart'
    as _i587;
import '../../features/occasion/domain/repos/occasion_remote_data_source_contract.dart'
    as _i237;
import '../../features/occasion/domain/repos/occasion_repository_contract.dart'
    as _i234;
import '../../features/occasion/domain/use_cases/get_all_occasions_use_case.dart'
    as _i34;
import '../../features/occasion/domain/use_cases/get_product_by_occasion_useCase.dart'
    as _i250;
import '../../features/occasion/presentation/view_model/cubits/occasion_cubit.dart'
    as _i17;
import '../../features/productsDetails/data/remote/product_details_remote_data_source.dart'
    as _i1048;
import '../../features/productsDetails/data/remote/product_details_remote_data_source_impl.dart'
    as _i442;
import '../../features/productsDetails/data/repository/get_product_details_impl.dart'
    as _i232;
import '../../features/productsDetails/domain/repository/get_product_details_contract.dart'
    as _i877;
import '../../features/productsDetails/domain/useCases/get_product_details_use_case.dart'
    as _i691;
import '../../features/profile/data/data_source/profile_remote_data_source.dart'
    as _i998;
import '../../features/profile/data/data_source/profile_remote_data_source_impl.dart'
    as _i531;
import '../../features/profile/data/repos/profile_repo_impl.dart' as _i1072;
import '../../features/profile/domain/repos/profile_repo.dart' as _i1007;
import '../../features/profile/domain/use_case/change_password_use_case.dart'
    as _i342;
import '../../features/profile/domain/use_case/edit_profile_use_case.dart'
    as _i99;
import '../../features/profile/domain/use_case/get_user_data_use_case.dart'
    as _i743;
import '../../features/profile/domain/use_case/upload_photo__use_case.dart'
    as _i763;
import '../../features/profile/logout/data/data_sources/logout_data_source.dart'
    as _i621;
import '../../features/profile/logout/data/data_sources/logout_data_source_impl.dart'
    as _i934;
import '../../features/profile/logout/data/repositories/logout_repo_impl.dart'
    as _i107;
import '../../features/profile/logout/domain/repositories/logout_repo.dart'
    as _i872;
import '../../features/profile/logout/domain/use_cases/logout_use_case.dart'
    as _i440;
import '../../features/profile/presentation/view/cubit/profile_cubit.dart'
    as _i851;
import '../../features/profile/presentation/view_model/edit_profile_cubit.dart'
    as _i589;
import '../apiManger/api_manager.dart' as _i29;
import '../apiManger/apiService.dart' as _i171;
import '../apiManger/dio_module.dart' as _i304;
import '../provider/app_config_provider.dart' as _i291;
import '../utils/services/secure_sotrage_service.dart' as _i665;

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
    gh.singleton<_i291.AppConfigProvider>(() => _i291.AppConfigProvider());
    gh.singleton<_i665.SecureStorageService>(
      () => _i665.SecureStorageService(),
    );
    gh.singleton<_i646.GuestManager>(() => _i646.GuestManager());
    gh.factory<_i237.OccasionRemoteDataSourceContract>(
      () => _i61.OccasionRemoteDataSourceImpl(),
    );
    gh.factory<_i162.RegisterRepositoryDataSourceContract>(
      () => _i80.RegisterDataSourceImpl(),
    );
    gh.factory<_i234.OccasionRepositoryContract>(
      () => _i587.OccasionRepositoryImpl(
        occasionRemoteDataSourceContract:
            gh<_i237.OccasionRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i250.GetProductByOccasionUsecase>(
      () => _i250.GetProductByOccasionUsecase(
        gh<_i234.OccasionRepositoryContract>(),
      ),
    );
    gh.factory<_i621.LogoutDataSource>(() => _i934.LogoutDataSourceImpl());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.LogInterceptor>(),
        gh<_i665.SecureStorageService>(),
      ),
    );
    gh.factory<_i251.RegisterRepositoryContracr>(
      () => _i518.RegisterRepositoryImpl(
        repositoryDataSourceContract:
            gh<_i162.RegisterRepositoryDataSourceContract>(),
      ),
    );
    gh.factory<_i34.GetAllOccasionsUseCase>(
      () => _i34.GetAllOccasionsUseCase(
        occasionRepositoryContract: gh<_i234.OccasionRepositoryContract>(),
      ),
    );
    gh.factory<_i577.LoginRemoteDataSource>(
      () => _i194.LoginRemoteDataSourceImp(apiManager: gh<_i29.ApiManager>()),
    );
    gh.factory<_i129.ForgetPasswordRemoteDataSource>(
      () => _i177.ForgetPasswordRemoteDataSourceImpl(
        apiManager: gh<_i29.ApiManager>(),
      ),
    );
    gh.factory<_i872.LogoutRepo>(
      () => _i107.LogoutRepoImpl(gh<_i621.LogoutDataSource>()),
    );
    gh.factory<_i17.OccasionCubit>(
      () => _i17.OccasionCubit(
        getAllOccasionsUseCase: gh<_i34.GetAllOccasionsUseCase>(),
        getProductByOccasionUsecase: gh<_i250.GetProductByOccasionUsecase>(),
      ),
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
    gh.factory<_i440.LogoutUseCase>(
      () => _i440.LogoutUseCase(gh<_i872.LogoutRepo>()),
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
    gh.factory<_i1048.ProductDetailsRemoteDataSource>(
      () => _i442.ProductDetailsRemoteDataSourceImpl(
        apiServices: gh<_i171.ApiService>(),
      ),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(
        registerRepositoryContracr: gh<_i251.RegisterRepositoryContracr>(),
      ),
    );
    gh.factory<_i632.LoginRepo>(
      () => _i21.LoginRepoImp(
        loginRemoteDataSource: gh<_i577.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i469.CategoriesScreenRemoteDataSource>(
      () => _i666.CategoriesScreenRemoteDataSourceImpl(
        apiService: gh<_i171.ApiService>(),
      ),
    );
    gh.factory<_i312.BestSellerDataSource>(
      () => _i158.BestSellerDataSourceImpl(gh<_i171.ApiService>()),
    );
    gh.factory<_i826.CategoriesScreenRepo>(
      () => _i750.CategoriesScreenRepoImpl(
        categoriesRemoteDataSource:
            gh<_i469.CategoriesScreenRemoteDataSource>(),
      ),
    );
    gh.factory<_i595.GetAllCategoriesUseCase>(
      () => _i595.GetAllCategoriesUseCase(
        categoriesScreenRepo: gh<_i826.CategoriesScreenRepo>(),
      ),
    );
    gh.factory<_i629.BestSellerRepo>(
      () => _i12.BestSellerRepoImpl(gh<_i312.BestSellerDataSource>()),
    );
    gh.factory<_i569.CartRemoteDataSource>(
      () => _i373.CartRemoteDataSourcseImpl(apiService: gh<_i171.ApiService>()),
    );
    gh.factory<_i461.GetBestSellerUseCase>(
      () => _i461.GetBestSellerUseCase(
        bestSellerRepo: gh<_i629.BestSellerRepo>(),
      ),
    );
    gh.factory<_i998.ProfileRemoteDataSource>(
      () =>
          _i531.ProfileRemoteDataSourceImpl(apiService: gh<_i171.ApiService>()),
    );
    gh.factory<_i877.GetProductDetailsContract>(
      () => _i232.GetProductDetailsImpl(
        remoteDataSource: gh<_i1048.ProductDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i123.CartRepo>(
      () => _i806.CartRepoImpl(
        cartRemoteDataSource: gh<_i569.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i334.LoginUsecase>(
      () => _i334.LoginUsecase(repo: gh<_i632.LoginRepo>()),
    );
    gh.factory<_i717.BestSellerCubit>(
      () => _i717.BestSellerCubit(gh<_i461.GetBestSellerUseCase>()),
    );
    gh.factory<_i86.GetProductsByCategoryUseCase>(
      () => _i86.GetProductsByCategoryUseCase(
        getAllCategoriesRepo: gh<_i826.CategoriesScreenRepo>(),
      ),
    );
    gh.factory<_i109.HomeCubit>(
      () => _i109.HomeCubit(
        getCategories: gh<_i595.GetAllCategoriesUseCase>(),
        getBestSeller: gh<_i461.GetBestSellerUseCase>(),
        getOccasions: gh<_i34.GetAllOccasionsUseCase>(),
      ),
    );
    gh.factory<_i691.GetProductDetailsUseCase>(
      () =>
          _i691.GetProductDetailsUseCase(gh<_i877.GetProductDetailsContract>()),
    );
    gh.factory<_i1007.ProfileRepo>(
      () => _i1072.ProfileRepoImpl(
        remoteDataSource: gh<_i998.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i99.EditProfileUseCase>(
      () => _i99.EditProfileUseCase(gh<_i1007.ProfileRepo>()),
    );
    gh.factory<_i763.UploadPhotoUseCase>(
      () => _i763.UploadPhotoUseCase(gh<_i1007.ProfileRepo>()),
    );
    gh.factory<_i240.ClearCartUsecase>(
      () => _i240.ClearCartUsecase(gh<_i123.CartRepo>()),
    );
    gh.factory<_i320.DeleteCartItemUsecase>(
      () => _i320.DeleteCartItemUsecase(gh<_i123.CartRepo>()),
    );
    gh.factory<_i691.GetUserCartUsecase>(
      () => _i691.GetUserCartUsecase(gh<_i123.CartRepo>()),
    );
    gh.factory<_i412.UpdateProductQuantityUseCase>(
      () => _i412.UpdateProductQuantityUseCase(gh<_i123.CartRepo>()),
    );
    gh.factory<_i659.AddToCartUsecase>(
      () => _i659.AddToCartUsecase(cartRepo: gh<_i123.CartRepo>()),
    );
    gh.factory<_i589.EditProfileCubit>(
      () => _i589.EditProfileCubit(
        gh<_i99.EditProfileUseCase>(),
        gh<_i763.UploadPhotoUseCase>(),
      ),
    );
    gh.factory<_i743.GetUserDataUseCase>(
      () => _i743.GetUserDataUseCase(
        profileRepositoryContract: gh<_i1007.ProfileRepo>(),
      ),
    );
    gh.factory<_i1069.CartCubit>(
      () => _i1069.CartCubit(
        gh<_i659.AddToCartUsecase>(),
        gh<_i412.UpdateProductQuantityUseCase>(),
        gh<_i691.GetUserCartUsecase>(),
        gh<_i320.DeleteCartItemUsecase>(),
        gh<_i240.ClearCartUsecase>(),
      ),
    );
    gh.factory<_i342.ChangePasswordUseCase>(
      () => _i342.ChangePasswordUseCase(profileRepo: gh<_i1007.ProfileRepo>()),
    );
    gh.factory<_i851.ProfileCubit>(
      () => _i851.ProfileCubit(
        gh<_i743.GetUserDataUseCase>(),
        gh<_i440.LogoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i304.DioModule {}
