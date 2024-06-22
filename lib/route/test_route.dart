import 'package:vania/vania.dart';

class TestRoute extends Route {
  @override
  void register() {
    Router.basePrefix('api');

    Router.get("/list", () {
      return Response.json(
        {
          "message": "List of items",
          "data": [
            {"id": 1, "name": "Item 1"},
            {"id": 2, "name": "Item 2"},
            {"id": 3, "name": "Item 3"},
          ]
        },
      );
    });
  }
}
