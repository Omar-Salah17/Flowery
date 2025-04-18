import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/get_user_cart_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/update_product_quantity_use_case.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/features/home/presentation/view/HomeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/home_view_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
       BlocProvider(
      create: (context) => getIt<HomeCubit>(),
    ),
    
     BlocProvider(
          create:
              (context) => CartCubit(
                getIt.get<AddToCartUsecase>(),
                getIt.get<UpdateProductQuantityUseCase>(),
                getIt.get<GetUserCartUsecase>(),
                getIt.get<DeleteCartItemUsecase>(),
                getIt.get<ClearCartUsecase>(),
              ),
        ),
    
    ],child: HomeViewBody(),);
  }
  
}
