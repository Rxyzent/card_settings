import 'package:auto_route/auto_route.dart';
import 'package:card_settings/common/base/base_page.dart';
import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/common/gen/assets.gen.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:card_settings/presentation/settings/widgets/credit_card.dart';
import 'package:card_settings/presentation/settings/widgets/zoom.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage
    extends BasePage<SettingsCubit, SettingsBuildable, SettingsListenable> {
  const SettingsPage({super.key});

  @override
  Widget builder(BuildContext context, SettingsBuildable state) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ZoomableImage(child: CreditCard()),
            ],
          ),
        ),
      ),
    );
  }
}
