import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/helpers/result_type.dart';
import 'package:car_rental_app/common/services/firebase%20_helper.dart';
import 'package:car_rental_app/domain/models/user_model.dart';

class UserAlreadyExist implements Exception {
  @override
  String toString() =>
      'User with this email is already registred! Please try to login';
}

class SignUpAPI {
  FirebaseHelper? get _helper => Dependencies.resolve();

  Future<ResultType<UserModel>> signUp(UserModel model) async {
    final token = model.uniqueId;
    final users =
        await _helper?.users.where('email', isEqualTo: model.email).get();
    if (users != null && users.docs.isNotEmpty)
      return ResultType.failure(UserAlreadyExist());
    final user = await _helper?.users.doc(token).get();
    if (user == null || user.exists == true)
      return ResultType.failure(UserAlreadyExist());

    try {
      await _helper?.users.doc(token).set(model.toJSON());
      return ResultType.success(model);
    } catch (e) {
      return ResultType.failure(Exception(e.toString()));
    }
  }
}
