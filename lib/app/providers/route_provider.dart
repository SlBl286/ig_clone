import 'package:ig_clone/routes/router.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RouteProvider implements NyProvider {
  boot(Nylo nylo) async {
    nylo.addRouter(appRouter());

    return nylo;
  }
}
