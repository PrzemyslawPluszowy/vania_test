import 'package:racing/app/models/entity/user_entity.dart';
import 'package:racing/app/services/user_service.dart';
import 'package:vania/vania.dart';

class UserController extends Controller {
  final UserServices service = UserServices();
  Future<Response> index() async {
    try {
      final users = await service.index();
      return Response.json(users, 201);
    } catch (e, s) {
      print(s);

      return Response.json(
        {'message': 'An error occurred while fetching users $s'},
        500,
      );
    }
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'name': 'required|string|alpha',
      'email': 'required|email',
    }, {
      'name.required': 'Name is required',
      'name.string': 'Name must be a string',
      'name.alpha': 'Name must contain only alphabetic characters',
      'email.required': 'Email is required',
      'email.email': 'Invalid email format'
    });
    final newUser = UserEntity.fromJson(request.body);
    await service.store(newUser);
    return Response({"data": "sdsds"}, ResponseType.json, 201);
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({});
  }

  Future<Response> destroy(int id) async {
    return Response.json({});
  }
}

final UserController userController = UserController();
