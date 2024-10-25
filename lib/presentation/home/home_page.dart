import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_settings/common/base/base_page.dart';
import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/gen/assets.gen.dart';
import 'package:card_settings/presentation/home/cubit/home_cubit.dart';
import 'package:card_settings/presentation/home/cubit/home_state.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:card_settings/presentation/settings/settings_page.dart';
import 'package:card_settings/presentation/settings/widgets/change_color.dart';
import 'package:card_settings/presentation/settings/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends BasePage<HomeCubit, HomeBuildable, HomeListenable> {
  const HomePage({super.key});

  @override
  Widget builder(BuildContext context, HomeBuildable state) {
    final settings = state.settings!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 55 / 34,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Assets.icons.transparent.image(fit: BoxFit.fill),
                    ),
                    (settings.backgroundState == 'IMAGE' ||
                        settings.backgroundState == 'PHOTO')
                        ? SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Transform.scale(
                        scale: state.settings!.zoom,
                        child: state.settings!.backgroundState == 'PHOTO'
                            ? Image.file(File(settings.photo!.path!))
                            : CachedNetworkImage(
                          imageUrl: settings.imageUrl!,
                        ),
                      ),
                    )
                        : Container(
                      decoration: BoxDecoration(
                        color: hexStringToColor(settings.color!),
                        gradient: (settings.gradientColors!.length >= 2 &&
                            settings.backgroundState == 'GRADIENT')
                            ? LinearGradient(
                          begin:
                          alignments[settings.gradientBegin]!,
                          end: alignments[settings.gradientEnd]!,
                          colors: settings.gradientColors!
                              .map((hexColor) {
                            return hexStringToColor(hexColor);
                          }).toList(),
                        )
                            : null,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: settings.blur!, sigmaY: settings.blur!),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                      ),
                    ),
                    const CreditCard(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
                if(result !=  null && context.mounted){
                  context.read<HomeCubit>().setSettings(result);
                }
              },
              child: 'Edit'.w(500),
            )
          ],
        ),
      ),
    );
  }
}
