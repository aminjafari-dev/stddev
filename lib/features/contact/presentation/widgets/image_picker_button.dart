import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';

class ImagePickerButton extends StatelessWidget {
  ImagePickerButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.source});

  final IconData icon;
  final String title;
  final void Function(File) onTap;
  final ImageSource source;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var image = await ImagePicker().pickImage(source: source);
        if (image != null) {
          File file = File(image.path);
          onTap(file);
          Navigator.pop(context, file);
        }
      },
      child: Container(
        padding: GeneralConfig.all_8,
        decoration: BoxDecoration(
            borderRadius: GeneralConfig.radius_10, color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            STDSizedBox.width_8,
            Text(title, style: const TextStyle(fontSize: 13)),
            
          ],
        ),
      ),
    );
  }
}
