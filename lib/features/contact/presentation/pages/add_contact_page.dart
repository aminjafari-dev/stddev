import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/core/widgets/app_bar.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/image_picker_dialog.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/std_text_field.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/text_field_validation.dart';

// Page for adding a new contact
class AddContactPage extends StatefulWidget {
  AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  // Text editing controllers for various fields
  final TextEditingController _firstNameCont = TextEditingController();

  final TextEditingController _lastNameCont = TextEditingController();

  final TextEditingController _phoneNumberCont = TextEditingController();

  final TextEditingController _emailCont = TextEditingController();

  final TextEditingController _noteCont = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? image_file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar.appBar("Add new Contact"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            STDSizedBox.height_12,
            InkWell(
              onTap: () async {
                await STDImagePicker.imageChoice(context)
                    .then((v) => setState(() {
                          image_file = v;
                        }));
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                child: image_file == null
                    ? const Icon(Icons.add)
                    : ClipRRect(
                      borderRadius: GeneralConfig.radius_50,
                      child: Image.file(
                          image_file!,
                          fit: BoxFit.cover,
                        ),
                    ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  StdTextField(
                    controller: _firstNameCont,
                    hintText: "First name",
                    validator: (value) {
                      return value!.stringSize(value);
                    },
                  ),
                  StdTextField(
                    controller: _lastNameCont,
                    hintText: "Last name",
                    validator: (value) {
                      return value!.stringSize(value);
                    },
                  ),
                  StdTextField(
                    controller: _phoneNumberCont,
                    keyboardType: TextInputType.phone,
                    hintText: "Phone number",
                    validator: (value) {
                      return value!.phoneValidate;
                    },
                  ),
                  StdTextField(
                    controller: _emailCont,
                    hintText: "Email",
                    validator: (value) {
                      return value!.emailValidate;
                    },
                  ),
                  StdTextField(
                    controller: _noteCont,
                    hintText: "Notes",
                    validator: (value) {
                      return value!.stringSize(value);
                    },
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form validation successful
                  print("Contact details are valid");
                }
              },
              child: const Text("Save Contact"),
            ),
          ],
        ),
      ),
    );
  }
}
