import 'package:e_commerce_m_flutter/common/utils/constants/colors.dart';
import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/screen/home.dart';
import 'package:e_commerce_m_flutter/features/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'profile/screen/profile.dart';
import 'store/presentation/screen/store.dart';
import 'shop/presentation/bloc/navigation_bar/navigation_bar_cubit.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = MFunctions.isDarkMode(context);
    return BlocProvider(
      create: (_) => NavigationBarCubit(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<NavigationBarCubit, int>(
          builder: (context, state) {
            return NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: state,
              backgroundColor: darkMode ? MColors.black : MColors.white,
              onDestinationSelected: (index) =>
                  context.read<NavigationBarCubit>().selectIndex(index),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
                NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: 'Wishlist'),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'profile'),
              ],
            );
          },
        ),
        body: BlocBuilder<NavigationBarCubit, int>(
          builder: (context, selectedIndex) {
            final screens = [
              const HomeScreen(),
              const StoreScreen(),
              const WishListScreen(),
              const ProfileScreen(),
            ];
            return screens[selectedIndex];
          },
        ),
      ),
    );
  }
}
