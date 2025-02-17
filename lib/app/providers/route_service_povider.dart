import 'package:racing/route/test_route.dart';
import 'package:vania/vania.dart';
import 'package:racing/route/api_route.dart';
import 'package:racing/route/web.dart';
import 'package:racing/route/web_socket.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    WebRoute().register();
    ApiRoute().register();
    WebSocketRoute().register();
    TestRoute().register();
  }
}
