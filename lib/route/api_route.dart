import 'package:racing/app/http/controllers/user_controller.dart';
import 'package:vania/vania.dart';
import 'package:racing/app/http/controllers/home_controller.dart';
import 'package:racing/app/http/middleware/authenticate.dart';
import 'package:racing/app/http/middleware/home_middleware.dart';
import 'package:racing/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get('/user', userController.index);

    Router.get("/home", homeController.index);

    Router.post("/user", userController.store);

    Router.get("/hello-world", () {
      return Response.json({
        'message': 'Hello World',
      });
    }).middleware([HomeMiddleware()]);

    // Return error code 400
    Router.get('wrong-request',
            () => Response.json({'message': 'Hi wrong request'}))
        .middleware([ErrorResponseMiddleware()]);

    // Return Authenticated user data
    // Router.get("/user", () {
    //   return Response.json(Auth().user());
    // }).middleware([AuthenticateMiddleware()]);
  }
}
