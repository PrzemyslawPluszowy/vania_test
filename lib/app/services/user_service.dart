import 'package:racing/app/models/entity/user_entity.dart';
import 'package:racing/app/models/user.dart';

class UserServices {
  Future<List<UserEntity>> index() async {
    List<Map<String, dynamic>> json = await User().query().get();
    print(json);
    final users = json.map((e) => UserEntity.fromJson(e)).toList();
    return users;
  }

  Future<void> store(UserEntity user) async {
    Map<String, dynamic> data = user.toJson();
    await User().query().insert(data);
  }
}
