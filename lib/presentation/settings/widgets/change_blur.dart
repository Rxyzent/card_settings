import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeBlur extends StatelessWidget {
  const ChangeBlur({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<SettingsCubit>().buildable;
    return Column(
      children: [
        'Blur'.w(600).c(context.colors.white),
        const SizedBox(height: 32),
        Slider(
          value: state.blurValue,
          min: 0.0,
          max: 15.0,
          divisions: 150,
          activeColor: context.colors.white,
          inactiveColor: context.colors.white.withOpacity(0.24),
          label: state.blurValue.toStringAsFixed(1),
          onChanged: (value) {
            context.read<SettingsCubit>().setBlurValue(value);
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                context.read<SettingsCubit>().setBlurValue(0);
                context.read<SettingsCubit>().setSettingType(SettingType.none);
              },
              child: 'Cancel'.w(600).s(20).c(context.colors.white),
            ),
            TextButton(
              onPressed: () =>context.read<SettingsCubit>().setSettingType(SettingType.none),
              child: 'Save'.w(600).s(20).c(context.colors.white),
            ),
          ],
        )
      ],
    );
  }
}
