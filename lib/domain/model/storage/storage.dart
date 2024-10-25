import 'package:card_settings/common/base/base_storage.dart';
import 'package:card_settings/domain/model/background_settings/background_settings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Storage {
  Storage(this._box);

  final Box _box;

  @FactoryMethod(preResolve: true)
  static Future<Storage> create() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BackgroundSettingsImplAdapter());
    Hive.registerAdapter(PhotoImplAdapter());
    final box = await Hive.openBox('storage');
    return Storage(box);
  }

  BaseStorage<String> get token => BaseStorage(_box, 'token');

  BaseStorage<BackgroundSettings> get settings => BaseStorage(_box, 'settings');

  BaseStorage<bool> get theme => BaseStorage(_box, 'theme');
}
