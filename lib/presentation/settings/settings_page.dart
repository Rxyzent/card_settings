import 'package:auto_route/auto_route.dart';
import 'package:card_settings/common/base/base_page.dart';
import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:card_settings/presentation/settings/widgets/change_blur.dart';
import 'package:card_settings/presentation/settings/widgets/change_color.dart';
import 'package:card_settings/presentation/settings/widgets/change_image.dart';
import 'package:card_settings/presentation/settings/widgets/credit_card.dart';
import 'package:card_settings/presentation/settings/widgets/setting_buttons.dart';
import 'package:card_settings/presentation/settings/widgets/zoomable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage
    extends BasePage<SettingsCubit, SettingsBuildable, SettingsListenable> {
  const SettingsPage({super.key});

  @override
  Widget builder(BuildContext context, SettingsBuildable state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  context.read<SettingsCubit>().sendSettings();
                  Navigator.of(context).pop(state.settings);
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Icon(Icons.check,color: context.colors.white,),
                    'Save'.w(500).s(18).c(context.colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const ZoomableImage(
                child: CreditCard(),
              ),
              const SizedBox(height: 32),
              _SettingsWidget(settingType: state.settingType),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsWidget extends StatelessWidget {
  const _SettingsWidget({required this.settingType});

  final SettingType settingType;

  @override
  Widget build(BuildContext context) {
    switch (settingType) {
      case SettingType.none:
        return const SettingButtons();
      case SettingType.image:
        return const ChangeImage();
      case SettingType.blur:
        return const ChangeBlur();
      case SettingType.color:
        return const ChangeColor();
    }
  }
}
