import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:bai_9a/screens/main_page/categories_page/categories_page.dart';
import 'package:bai_9a/screens/main_page/home_page/home_page.dart';
import 'package:bai_9a/screens/main_page/my_cart_page/my_cart_page.dart';
import 'package:bai_9a/screens/main_page/profile_page/profile_page.dart';
import 'package:bai_9a/screens/main_page/wishlist_page/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  PageController pageCtrl = PageController();

  List<String> listIcon = [
    AppImages.ic_home,
    AppImages.ic_category,
    AppImages.ic_shopping,
    AppImages.ic_heart,
    AppImages.ic_profile,
  ];

  List<String> listTitle = [
    'Home',
    'Categories',
    'My Cart',
    'Wishlist',
    'Profile',
  ];

  List<String> listIconActive = [
    AppImages.ic_home_active,
    AppImages.ic_category_active,
    AppImages.ic_shopping_active,
    AppImages.ic_heart_active,
    AppImages.ic_profile_active,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                HomePage(),
                CategoriesPage(),
                MyCartPage(),
                WishListScreen(),
                ProfilePage(),
              ],
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: pageCtrl,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? 8 : 0,
            ),
            child: Row(
              children: [
                buildItem(0),
                buildItem(1),
                buildItem(2),
                buildItem(3),
                buildItem(4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(int i) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (index != i) {
            setState(() {
              index = i;
            });
            pageCtrl.jumpToPage(i);
          }
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                index == i ? listIconActive[i] : listIcon[i],
                width: 24,
                height: 24,
              ),
              Text(
                listTitle[i],
                style: AppTextStyle.textSmall.copyWith(
                  color: index == i ? AppColors.cYanPrimary : AppColors.cGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
