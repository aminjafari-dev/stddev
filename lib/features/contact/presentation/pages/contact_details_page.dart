import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/core/widgets/app_bar.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';

import '../../../../config/styles/image_path.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as ContactEntity;

    return Scaffold(
      appBar: STDAppBar.appBar("Contact Details"),
      body: Padding(
        padding: GeneralConfig.all_8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            STDSizedBox.height_12,
            contact.picture == null || contact.picture!.isEmpty
                ? Image.asset(ImagePath.std)
                : ClipRRect(
                    borderRadius: GeneralConfig.radius_10,
                    child: Image.network(
                      contact.picture!.first,
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                  ),
            STDSizedBox.height_12,
            Text("Name : ${contact.firstName}  ${contact.lastName}"),
            STDSizedBox.height_12,
            Text("Phone number : ${contact.phone}"),
            STDSizedBox.height_12,
            Text("email :  ${contact.email}"),
            STDSizedBox.height_12,
            Text("note :  ${contact.notes}")
          ],
        ),
      ),
    );
  }
}
