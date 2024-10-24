import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsCubit extends BaseCubit<SettingsBuildable, SettingsListenable> {
  SettingsCubit() : super(const SettingsBuildable());
}