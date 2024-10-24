import 'package:card_settings/domain/model/user/user_model.dart';

abstract class MainRepo {
  Future<void> setThemeMode(bool themeMode);

  bool? getThemeMode();

  UserModel? getUser();

  Future<void> setUser(UserModel user);
}