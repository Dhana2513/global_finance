import 'package:get_storage/get_storage.dart';
import 'package:momentum_test/screens/register/user_model.dart';

class SessionManager {
  static GetStorage? _storage;
  static final SessionManager _manager = SessionManager._internal();

  factory SessionManager() {
    _storage ??= GetStorage();
    return _manager;
  }

  SessionManager._internal();

  static const KEY_USER_DETAILS = 'KEY_USER_DETAILS';

  void addUserDetails(UserModel model) {
    _storage!.write(KEY_USER_DETAILS, model);
  }

  UserModel? getUserDetails() {
    return _storage!.read(KEY_USER_DETAILS);
  }

  void removeUserDetails() {
    _storage!.remove(KEY_USER_DETAILS);
  }
}
