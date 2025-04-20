import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/cart/presentation/view/cart_view.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
import 'package:flowery/features/categories/presentation/view/categories_screen.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flowery/features/home/presentation/view/home_view.dart';
import 'package:flowery/features/profile/presentation/view/profile_view.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const CategoriesScreen(),
    const CartView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
        BlocProvider(
          create:
              (context) => CategoriesScreenCubit(
                getIt.get<GetAllCategoriesUseCase>(),
                getIt.get<GetProductsByCategoryUseCase>(),
              )..getAllCategories(),
      
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: PalletsColors.mainColorBase,
          unselectedItemColor: PalletsColors.gray,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: LocaleKeys.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.category_outlined),
              label: LocaleKeys.categories.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: LocaleKeys.cart.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              label: LocaleKeys.profile.tr(),
            ),
          ],
        ),
        body: _screens[_selectedIndex],
      ),
    );
  }
}
