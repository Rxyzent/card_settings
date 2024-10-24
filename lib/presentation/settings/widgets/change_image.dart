import 'package:card_settings/common/constants/constants.dart';
import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChangeImage extends StatelessWidget {
  const ChangeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        'Default images:'.w(500).s(18).c(context.colors.white),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: context.colors.white,
                      width: 3,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    Constants.defaultImages[index],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8);
            },
            itemCount: Constants.defaultImages.length,
          ),
        ),
        const SizedBox(height: 16),
        'Images from device storage:'.w(500).s(18).c(context.colors.white),
        ElevatedButton(
          onPressed: () => _pickImage(context),
          child: 'Gallery'.w(500).c(context.colors.white),
        ),
      ],
    );
  }
}

Future<void> _pickImage(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (!context.mounted) return;
  context.read<SettingsCubit>().saveImage(image!.path);
}
