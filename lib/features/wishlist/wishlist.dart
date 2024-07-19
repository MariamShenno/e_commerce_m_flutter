import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/common/widgets/icons/m_circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/layouts/grid_view_layout.dart';
import '../../common/widgets/appbar/m_app_bar.dart';
import '../shop/presentation/screen/home.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title:
            Text("WishList", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          MCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
               MGridViewLayout(itemCount: 4, mainAxisExtent: 250),
            ],
          ),
        ),
      ),
    );
  }
}
