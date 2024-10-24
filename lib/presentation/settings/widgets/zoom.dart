import 'dart:ui';

import 'package:flutter/material.dart';

class ZoomableImage extends StatefulWidget {
  const ZoomableImage({super.key, required this.child});

  final Widget child;
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
      aspectRatio: 55/34,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Transform.scale(
              scale: _scale,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRepCoPVhIXI3rEUss3pxeNaHcqwHHgVHZTeQ&s', // Замените на URL вашей фотографии
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.yellowAccent,
              width: double.infinity,
              height: double.infinity,
            ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.red.withOpacity(0.3), // Blurred color overlay
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            GestureDetector(
              onScaleStart: _onScaleStart,
              onScaleUpdate: _onScaleUpdate,
              onScaleEnd: _onScaleEnd,
              child:  widget.child,
            ),
          ],
        ),
      ),
    );
  }
}