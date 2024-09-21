import 'package:design_app/views/about/binding.dart';
import 'package:design_app/views/about/index.dart';
import 'package:design_app/views/account/binding.dart';
import 'package:design_app/views/account/index.dart';
import 'package:design_app/views/addDesign/binding.dart';
import 'package:design_app/views/addDesign/index.dart';
import 'package:design_app/views/admin_dashboard/binding.dart';
import 'package:design_app/views/admin_dashboard/index.dart';
import 'package:design_app/views/auth/binding.dart';
import 'package:design_app/views/auth/index.dart';
import 'package:design_app/views/category/binding.dart';
import 'package:design_app/views/category/index.dart';
import 'package:design_app/views/contact_us/binding.dart';
import 'package:design_app/views/contact_us/index.dart';
import 'package:design_app/views/design/designer/binding.dart';
import 'package:design_app/views/design/designer/index.dart';
import 'package:design_app/views/design/user/binding.dart';
import 'package:design_app/views/design/user/index.dart';
import 'package:design_app/views/designerHome/binding.dart';
import 'package:design_app/views/designerHome/index.dart';
import 'package:design_app/views/designer_account/binding.dart';
import 'package:design_app/views/designer_account/index.dart';
import 'package:design_app/views/home/binding.dart';
import 'package:design_app/views/home/index.dart';
import 'package:design_app/views/main/binding.dart';
import 'package:design_app/views/main/index.dart';
import 'package:design_app/views/explore/binding.dart';
import 'package:design_app/views/explore/index.dart';
import 'package:design_app/views/my_designes/binding.dart';
import 'package:design_app/views/my_designes/index.dart';
import 'package:design_app/views/orderHistory/binding.dart';
import 'package:design_app/views/orderHistory/index.dart';
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
        GetPage(
          name: Pages.contactus.value,
          page: () => ContactUsPage(),
          binding: ContactUsBinding(),
        ),
        GetPage(
          name: Pages.about.value,
          page: () => AboutPage(),
          binding: AboutBinding(),
        ),
        GetPage(
          name: Pages.designerHome.value,
          page: () => DesignerHomePage(),
          binding: DesignerHomeBinding(),
        ),
        GetPage(
          name: Pages.addDesign.value,
          page: () => AddDesignPage(),
          binding: AddDesignBinding(),
        ),
        GetPage(
          name: Pages.myDesignes.value,
          page: () => MyDesignesPage(),
          binding: MyDesignesBinding(),
        ),
        GetPage(
          name: Pages.accountDesigner.value,
          page: () => DesignerAccountPage(),
          binding: DesignerAccountBinding(),
        ),
        GetPage(
          name: Pages.category.value,
          page: () => CategoryPage(),
          binding: CategoryBinding(),
        ),
        GetPage(
          name: Pages.orderHistory.value,
          page: () => OrderHistoryPage(),
          binding: OrderHistoryBinding(),
        ),
      ];
}

enum Pages {
  splash,
  auth,
  main,
  admin,
  category,
  designerdesign,
  userdesign,
  home,
  explore,
  account,
  contactus,
  about,
  designerHome,
  addDesign,
  myDesignes,
  accountDesigner,
  orderHistory,
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
      case Pages.contactus:
        return '/contact';
      case Pages.about:
        return '/about';
      case Pages.designerHome:
        return '/designerHome';
      case Pages.addDesign:
        return '/addDesign';
      case Pages.myDesignes:
        return '/myDesignes';
      case Pages.accountDesigner:
        return '/accountDesigner';
      case Pages.category:
        return '/category';
      case Pages.orderHistory:
        return '/orderHistory';
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
      case '/contact':
        return Pages.contactus;
      case '/about':
        return Pages.about;
      case '/designerHome':
        return Pages.designerHome;
      case '/addDesign':
        return Pages.addDesign;
      case '/myDesignes':
        return Pages.myDesignes;
      case '/accountDesigner':
        return Pages.accountDesigner;
      case '/category':
        return Pages.category;
      case '/orderHistory':
        return Pages.orderHistory;
      default:
        return null;
    }
  }
}
