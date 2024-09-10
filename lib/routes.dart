import 'package:design_app/views/account/binding.dart';
import 'package:design_app/views/account/index.dart';
import 'package:design_app/views/admin_dashboard/binding.dart';
import 'package:design_app/views/admin_dashboard/index.dart';
import 'package:design_app/views/auth/binding.dart';
import 'package:design_app/views/auth/index.dart';
import 'package:design_app/views/design/designer/binding.dart';
import 'package:design_app/views/design/designer/index.dart';
import 'package:design_app/views/design/user/binding.dart';
import 'package:design_app/views/design/user/index.dart';
import 'package:design_app/views/home/binding.dart';
import 'package:design_app/views/home/index.dart';
import 'package:design_app/views/main/binding.dart';
import 'package:design_app/views/main/index.dart';
import 'package:design_app/views/explore/binding.dart';
import 'package:design_app/views/explore/index.dart';
import 'package:design_app/views/splash/binding.dart';
import 'package:design_app/views/splash/index.dart';
import 'package:get/get.dart';

abstract class AppRouting {
  static List<GetPage> routes() => [
        GetPage(
          name: Pages.splash.value,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Pages.auth.value,
          page: () => AuthPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: Pages.main.value,
          page: () => MainPage(),
          binding: MainBinding(),
        ),
        GetPage(
          name: Pages.admin.value,
          page: () => AdminPage(),
          binding: AdminBinding(),
        ),
        GetPage(
          name: Pages.designerdesign.value,
          page: () => DesignerDesignPage(),
          binding: DesignerDesignBinding(),
        ),
        GetPage(
          name: Pages.userdesign.value,
          page: () => UserDesignPage(),
          binding: UserDesignBinding(),
        ),
        GetPage(
          name: Pages.home.value,
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Pages.explore.value,
          page: () => ExplorePage(),
          binding: ExploreBinding(),
        ),
        GetPage(
          name: Pages.account.value,
          page: () => AccountPage(),
          binding: AccountBinding(),
        ),
      ];
}

enum Pages {
  splash,
  auth,
  main,
  admin,
  designerdesign,
  userdesign,
  home,
  explore,
  account,
}

extension PagesExtension on Pages {
  String get value {
    switch (this) {
      case Pages.splash:
        return '/splash';
      case Pages.auth:
        return '/auth';
      case Pages.main:
        return '/main';
      case Pages.admin:
        return '/admin';
      case Pages.designerdesign:
        return '/designerdesign';
      case Pages.userdesign:
        return '/userdesign';
      case Pages.home:
        return '/home';
      case Pages.explore:
        return '/explore';
      case Pages.account:
        return '/account';
      default:
        throw 'unnamed route';
    }
  }
}

abstract class Navigation {
  static Pages? getPage(String route) {
    switch (route) {
      case '/splash':
        return Pages.splash;
      case '/auth':
        return Pages.auth;
      case '/main':
        return Pages.main;
      case '/admin':
        return Pages.admin;
      case '/designerdesign':
        return Pages.designerdesign;
      case '/userdesign':
        return Pages.userdesign;
      case '/home':
        return Pages.home;
      case '/explore':
        return Pages.explore;
      case '/account':
        return Pages.account;
      default:
        return null;
    }
  }
}
