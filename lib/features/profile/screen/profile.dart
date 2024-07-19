import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/common/widgets/appbar/m_app_bar.dart';
import 'package:e_commerce_m_flutter/common/widgets/images/m_circular_image.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/categories_widgets/section_heading.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_menu.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: const MAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
            // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const MCircularImage(
                      image: MImages.darkAppLogo,
                      width: 95,
                      height: 100,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Change profile picture",
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ),
              ),
              // Details
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              // Heading Profile Info
              const MSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),
              MProfileMenu(
                  title: "Name", value: "Mariam Shenno", onPressed: () {}),
              // MProfileMenu(
              //     title: "UserName",
              //     value: "Flutter Developer",
              //     onPressed: () {}),
              const SizedBox(height: MSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              // Heading Personal Info
              const MSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),

              /////// Check >>>> تجي البيانات من الداتا بيز وباقي البيانات تكون نل وبس يعمل اديت للبيانات تصير تنحفظ بالداتابيز بدل نل
              // MProfileMenu(
              //     title: "User ID",
              //     value: "1",
              //     icon: Iconsax.copy,
              //     onPressed: () {}),
              MProfileMenu(
                  title: "E-mail", value: "mariam@gmail.com", onPressed: () {}),
              MProfileMenu(
                  title: "Phone Namber", value: "05123", onPressed: () {}),
              // MProfileMenu(title: "Gender", value: "Female", onPressed: () {}),
              // MProfileMenu(
              //     title: "Date of Birth", value: " 5 Jun", onPressed: () {}),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
