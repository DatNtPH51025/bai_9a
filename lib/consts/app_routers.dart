import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/screens/add_product/add_product.dart';
import 'package:bai_9a/screens/intro_page/intro_page.dart';
import 'package:bai_9a/screens/login_page/login_page.dart';
import 'package:bai_9a/screens/main_page/home_page/home_page.dart';
import 'package:bai_9a/screens/main_page/list_product_page/list_product_page.dart';
import 'package:bai_9a/screens/main_page/main_page.dart';
import 'package:bai_9a/screens/main_page/my_cart_page/my_cart_page.dart';
import 'package:bai_9a/screens/main_page/wishlist_page/wishlist_page.dart';
import 'package:bai_9a/screens/product_detail_page/product_detail_page.dart';
import 'package:bai_9a/screens/signup_page/signup_page.dart';
import 'package:bai_9a/screens/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static AppRouter? _instance;

  static AppRouter get I {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppRouter._();
      return _instance!;
    }
  }

  MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (BuildContext context) {
        return router(
          context: context,
          routeName: settings.name!,
          data: settings.arguments,
        );
      },
    );
  }

  static router(
      {required BuildContext context,
      required String routeName,
      Object? data}) {
    switch (routeName) {
      case AppRoutePath.splash:
        return SplashPage();
      case AppRoutePath.login:
        return LoginPage();
      case AppRoutePath.signUpOne:
        return SignUpPage();
      case AppRoutePath.homePage:
        return HomePage();
      case AppRoutePath.introPage:
        return IntroPage();
      case AppRoutePath.mainPage:
        return MainPage();
      case AppRoutePath.wishlistPage:
        return WishListScreen();
      case AppRoutePath.myCartPage:
        return MyCartPage();
      case AppRoutePath.productDetail:
        return ProductDetailPage();
      case AppRoutePath.addProduct:
        return AddProduct();
      case AppRoutePath.listProductPage:
        return ListProductPage(
          idCate: (data as List)[0],
          title: data[1],
        );
      default:
        return SizedBox();
    }
  }
}
