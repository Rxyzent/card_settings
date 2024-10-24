import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingButtons extends StatelessWidget {
  const SettingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _CircularButton(
          onPress: () => context.read<SettingsCubit>().setSettingType(SettingType.image),
          icon: Icons.image_outlined,
          title: 'Image',
        ),
        _CircularButton(
          onPress: () => context.read<SettingsCubit>().setSettingType(SettingType.blur),
          icon: Icons.blur_on_outlined,
          title: 'Blur',
        ),
        _CircularButton(
          onPress: () => context.read<SettingsCubit>().setSettingType(SettingType.color),
          icon: Icons.color_lens_outlined,
          title: 'Color',
        ),
      ],
    );
  }
}

class _CircularButton extends StatelessWidget {
  const _CircularButton({
    required this.onPress,
    required this.icon,
    required this.title,
  });

  final void Function() onPress;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.colors.label,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  color: context.colors.white,
                  icon,
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          title.w(500).c(context.colors.white),
        ],
      ),
    );
  }
}