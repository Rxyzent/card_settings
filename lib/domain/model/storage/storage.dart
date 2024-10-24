import 'package:card_settings/common/base/base_storage.dart';
import 'package:card_settings/domain/model/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Storage {
  Storage(this._box);

  final Box _box;

  @FactoryMethod(preResolve: true)
  static Future<Storage> create() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelImplAdapter());
    final box = await Hive.openBox('storage');
    return Storage(box);
  }

  BaseStorage<String> get token => BaseStorage(_box, 'token');

  BaseStorage<String> get fcmToken => BaseStorage(_box, 'fcm-token');

  BaseStorage<UserModel> get userData => BaseStorage(_box,'user_info');

  BaseStorage<String> get deviceId => BaseStorage(_box, 'device_id');

  BaseStorage<bool> get theme => BaseStorage(_box, 'theme');
}
