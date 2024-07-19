import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/m_app_bar.dart';
import '../../../shop/presentation/widgets/categories_widgets/section_heading.dart';
import '../../../shop/presentation/widgets/home_appbar_widgets/cart_menu_icon.dart';
import '../../../shop/presentation/widgets/home_appbar_widgets/search_container.dart';
import '../widgets/brand_card.dart';
import '../widgets/category_tab.dart';
import '../widgets/tab_bar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: MAppBar(
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            MCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: MFunctions.isDarkMode(context)
                    ? MColors.black
                    : MColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(MSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search bar
                      const SizedBox(height: MSizes.spaceBtwItems),
                      const MSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),

                      /// Featured Brands
                      MSectionHeading(
                          title: "Featured Brands", onPressed: () {}),
                      const SizedBox(height: MSizes.spaceBtwItems / 1.5),
                      SizedBox(
                        height: 320,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: MSizes.gridViewSpacing,
                            crossAxisSpacing: MSizes.gridViewSpacing,
                            mainAxisExtent: 80,
                          ),
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return const  MBrandCard(showBorder: true);
                         
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Tabs
                bottom: const MTabBar(
                  tabs: [
                    Tab(child: Text("Sport")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Cloths")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          // body
          body: const TabBarView(
            children: [
              // category tab
              MCategoryTab(),
              MCategoryTab(),
              MCategoryTab(),
              MCategoryTab(),
              MCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
