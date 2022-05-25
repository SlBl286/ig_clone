import 'package:ig_clone/resources/pages/chat_list_page.dart';
import 'package:ig_clone/resources/pages/chat_page.dart';
import 'package:ig_clone/resources/pages/custom_image_picker_page.dart';
import 'package:ig_clone/resources/pages/first_page.dart';
import 'package:ig_clone/resources/pages/home_page.dart';
import 'package:ig_clone/resources/pages/login_page.dart';
import 'package:ig_clone/resources/pages/profile_edit_page.dart';
import 'package:ig_clone/resources/pages/search_page.dart';
import 'package:ig_clone/resources/pages/setting_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:page_transition/page_transition.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "flutter pub run nylo_framework:main make:page my_page"
| Learn more https://nylo.dev/docs/3.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route("/", (context) => FirstPage());

      // Add your routes here

      router.route(MyHomePage.route, (context) => MyHomePage(),
          transition: PageTransitionType.fade);
      router.route(SearchPage.route, (context) => SearchPage());
      router.route(LoginPage.route, (context) => LoginPage(),
          transition: PageTransitionType.fade);
      router.route(ChatListPage.route, (context) => ChatListPage(),
          transition: PageTransitionType.rightToLeft);
      router.route(ProfileEditPage.route, (context) => ProfileEditPage(),
          transition: PageTransitionType.bottomToTop);
      router.route(
          CustomImagePickerPage.route, (context) => CustomImagePickerPage(),
          transition: PageTransitionType.bottomToTop);
      router.route(SettingPage.route, (context) => SettingPage(),
          transition: PageTransitionType.rightToLeft);
      router.route(ChatPage.route, (context) => ChatPage(),
          transition: PageTransitionType.rightToLeft);
    });
