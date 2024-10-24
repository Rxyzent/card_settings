import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      pickerColor: Colors.transparent,
      onColorChanged: (Color value) {},
    );
  }
}
