import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/core/widgets/app_bar.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';
import 'package:std_dev_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/image_picker_button.dart';

import '../../../../config/styles/image_path.dart';
import '../../../../core/dependency/dependency_injection.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({
    super.key,
   required this.contact
  });
    final ContactEntity contact;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: STDAppBar.appBar("Contact Details"),
      body: Padding(
        padding: GeneralConfig.all_8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            STDSizedBox.height_30,
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
            Text("Name : ${contact.firstName} ${contact.lastName}"),
            STDSizedBox.height_12,
            Text("Phone number : ${contact.phone}"),
            STDSizedBox.height_12,
            Text("email :  ${contact.email}"),
            STDSizedBox.height_12,
            Text("note :  ${contact.notes}"),
            STDSizedBox.height_30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      locator<ContactBloc>()
                          .add(DeleteContactEvent(contact.id!));
                    },
                    icon: BlocConsumer<ContactBloc, ContactState>(
                      listener: (context, state) {
                        if (state.deleteContact is EventCompleted) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        if (state.deleteContact is EventLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Icon(Icons.delete);
                        }
                      },
                    )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
