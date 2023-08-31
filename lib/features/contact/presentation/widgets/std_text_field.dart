import 'package:flutter/material.dart';
import 'package:std_dev_task/config/general_config.dart';

class StdTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String? value)? validator;
  const StdTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: GeneralConfig.radius_50
        
      ),
      padding: GeneralConfig.all_8,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
