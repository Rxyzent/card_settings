import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_settings/common/gen/assets.gen.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:card_settings/presentation/settings/widgets/change_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZoomableImage extends StatefulWidget {
  const ZoomableImage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  double _previousScale = 1.0;
  double _scale = 1.0;

  void _onScaleStart (ScaleStartDetails details){
    _previousScale = _scale;
  }
  void _onScaleUpdate (ScaleUpdateDetails details){
    setState(() {
      _scale = _previousScale*details.scale;
      context.read<SettingsCubit>().setZoom(_scale);
    });
  }
  void _onScaleEnd (ScaleEndDetails details){
    _previousScale = _scale;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsCubit>().buildable;
    final settings = state.settings!;
    return AspectRatio(
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
            (settings.backgroundState == 'IMAGE' || settings.backgroundState == 'PHOTO')
                ? SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Transform.scale(
                      scale: _scale,
                      child: settings.backgroundState == 'PHOTO'
                          ? Image(
                              image: MemoryImage(
                                  base64Decode(settings.photo!.imageBase64!)),
                            )
                          : CachedNetworkImage(
                              imageUrl: settings.imageUrl!,
                            ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: hexStringToColor(settings.color!),
                      gradient: (settings.gradientColors!.length >= 2 &&
                              state.gradientState)
                          ? LinearGradient(
                              begin: alignments[settings.gradientBegin]!,
                              end: alignments[settings.gradientEnd]!,
                              colors: settings.gradientColors!.map((hexColor) {
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
            GestureDetector(
              onScaleStart: _onScaleStart,
              onScaleUpdate:_onScaleUpdate,
              onScaleEnd: _onScaleEnd,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
