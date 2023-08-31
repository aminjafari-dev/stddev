import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/circle_button.dart';

class STDImagePicker {
  static Future<File?> imageChoice(BuildContext context) async {
    File? file;
    await showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          titlePadding: GeneralConfig.all_8,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleButton(
                    icon: Icons.photo,
                    title: "From gallery",
                    source: ImageSource.gallery,
                    onTap: (v) {
                      print(v);
                      file = v;
                    },
                  ),
                  CircleButton(
                    icon: Icons.photo_camera,
                    title: "Take a photo",
                    source: ImageSource.camera,
                    onTap: (v) {
                      print(v);
                      file = v;
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
    return file;
  }
}
