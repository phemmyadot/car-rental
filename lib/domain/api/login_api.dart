import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/helpers/result_type.dart';
import 'package:car_rental_app/common/services/firebase%20_helper.dart';
import 'package:car_rental_app/domain/models/user_model.dart';

class UserNotRegistredException implements Exception {
  @override
  String toString() => 'Wrong email or password!';
}

class LoginAPI {
  FirebaseHelper? get _helper => Dependencies.resolve();

  Future<ResultType<UserModel>> login(String token) async {
    final user = await _helper?.users.doc(token).get();
    if (user == null || user.exists == false || user.data() == null)
      return ResultType.failure(UserNotRegistredException());
    try {
      return ResultType.success(UserModel.fromJSON(user.data()!));
    } catch (e) {
      return ResultType.failure(Exception(e.toString()));
    }
  }
}
