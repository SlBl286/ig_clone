import 'package:ig_clone/resources/pages/first_page.dart';
import 'package:ig_clone/resources/pages/home_page.dart';
import 'package:ig_clone/resources/pages/login_page.dart';
import 'package:ig_clone/resources/pages/search_page.dart';
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
    });
