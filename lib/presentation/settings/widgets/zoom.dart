import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ZoomableImage extends StatefulWidget {
  const ZoomableImage({
    super.key,
    required this.child,
    required this.imageUsed,
    required this.blurValue,
    required this.color,
    required this.gradientBegin,
    required this.gradientEnd,
    required this.gradientColors,
    required this.enableGradient,
  });

  final Widget child;
  final bool imageUsed;
  final double blurValue;
  final Color color;
  final bool enableGradient;
  final Alignment gradientBegin;
  final Alignment gradientEnd;
  final List<Color> gradientColors;

  @override
  State<ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = _previousScale * details.scale;
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _previousScale = _scale;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 55 / 34,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            widget.imageUsed
                ? Transform.scale(
                    scale: _scale,
                    child: CachedNetworkImage(
                      imageUrl:'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=',
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: widget.color,
                      gradient: (widget.gradientColors.length >= 2 && widget.enableGradient)
                          ? LinearGradient(
                              begin: widget.gradientBegin,
                              end: widget.gradientEnd,
                              colors: widget.gradientColors,
                            )
                          : null,
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: widget.blurValue, sigmaY: widget.blurValue),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            GestureDetector(
              onScaleStart: _onScaleStart,
              onScaleUpdate: _onScaleUpdate,
              onScaleEnd: _onScaleEnd,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
