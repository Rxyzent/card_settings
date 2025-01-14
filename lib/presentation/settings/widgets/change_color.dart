import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ChangeColor extends StatelessWidget {
  const ChangeColor({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsCubit>().buildable;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'Change background color'.w(500).s(20).c(context.colors.white),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                'Gradient'.w(500).s(18).c(context.colors.white),
                Switch(
                  value: state.gradientState,
                  inactiveTrackColor: context.colors.label,
                  onChanged: (value) {
                    context.read<SettingsCubit>().changeGradientState(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            state.gradientState
                ? const _GradientColorWidget()
                : const _SolidColorWidget(),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.read<SettingsCubit>().setSettingType(SettingType.none);
              },
              child: 'Complete'.w(600).s(20).c(context.colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _SolidColorWidget extends StatelessWidget {
  const _SolidColorWidget();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsCubit>().buildable.settings!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            _showDialog(context, settings.color!, false);
          },
          child: Row(
            children: [
              const Icon(Icons.colorize_outlined),
              'Pick color'.w(500).c(context.colors.white),
            ],
          ),
        ),
        Container(
          height: 56,
          width: 56,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hexStringToColor(settings.color!),
            border: Border.all(
              color: context.colors.label,
              width: 2,
            ),
          ),
        ),
      ],
    );
  }
}

class _GradientColorWidget extends StatelessWidget {
  const _GradientColorWidget();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsCubit>().buildable;
    final settings = state.settings!;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Begin:'.w(500).s(18).c(context.colors.white),
            Container(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: DropdownButton(
                elevation: 0,
                hint: 'gradient begin : '.w(500).c(context.colors.white),
                dropdownColor: context.colors.white,
                value: settings.gradientBegin,
                items: state.beginAlignments!.keys
                    .map<DropdownMenuItem<String>>((String key) {
                  return DropdownMenuItem(
                    value: key,
                    child: key.w(500).c(context.colors.black),
                  );
                }).toList(),
                onChanged: (value) {
                  context.read<SettingsCubit>().setAlignment(value!, true);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'End:'.w(500).s(18).c(context.colors.white),
            Container(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: DropdownButton(
                elevation: 0,
                hint: 'gradient begin : '.w(500).c(context.colors.white),
                dropdownColor: context.colors.white,
                value: settings.gradientEnd,
                items: state.endAlignments!.keys
                    .map<DropdownMenuItem<String>>((String key) {
                  return DropdownMenuItem(
                    value: key,
                    child: key.w(500).c(context.colors.black),
                  );
                }).toList(),
                onChanged: (value) {
                  context.read<SettingsCubit>().setAlignment(value!, false);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: context.colors.label,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  'Colors:'.w(500).s(18).c(context.colors.white),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final circleColor =
                            settings.gradientColors!.length > index
                                ? hexStringToColor(
                                    settings.gradientColors![index])
                                : Colors.transparent;
                        return Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: circleColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.colors.headline,
                              width: 2,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 8);
                      },
                      itemCount: 5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<SettingsCubit>().removeGradientColor();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(context.colors.error)),
                        child: 'Remove'.w(500).c(context.colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (settings.gradientColors!.length == 5) {
                            context.read<SettingsCubit>().displayWarning();
                            return;
                          }
                          final lastColor = settings.gradientColors!.isNotEmpty
                              ? settings.gradientColors!.last
                              : settings.color;
                          _showDialog(context, lastColor!, true);
                        },
                        child: 'Add'.w(500).c(context.colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

void _showDialog(BuildContext context, String currentColor, bool isGradient) {
  var newColor = hexStringToColor(currentColor);
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: hexStringToColor(currentColor),
              onColorChanged: (Color color) {
                newColor = color;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                isGradient
                    ? context.read<SettingsCubit>().addGradientColor(newColor)
                    : context.read<SettingsCubit>().setColor(newColor);
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      });
}

Color hexStringToColor(String hexColor) {
  hexColor = hexColor.replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }
  return Color(int.parse(hexColor, radix: 16));
}
