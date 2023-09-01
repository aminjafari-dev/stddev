import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:std_dev_task/config/general_config.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/core/widgets/app_bar.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';
import 'package:std_dev_task/features/contact/presentation/bloc/contact_bloc.dart';

import '../../../../config/image_path.dart';
import '../../../../core/dependency/dependency_injection.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({
    super.key,
    required this.contact,
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
            // Display the contact picture if available, otherwise show a placeholder
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
            Text("Email :  ${contact.email}"),
            STDSizedBox.height_12,
            Text("Note :  ${contact.notes}"),
            STDSizedBox.height_30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Button to delete the contact
                IconButton(
                  onPressed: () {
                    // Trigger the delete contact event when the button is pressed
                    locator<ContactBloc>().add(DeleteContactEvent(contact.id!));
                  },
                  icon: BlocConsumer<ContactBloc, ContactState>(
                    listener: (context, state) {
                      if (state.deleteContact is EventCompleted) {
                        // Navigate back to the previous screen after successfully deleting the contact
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
                  ),
                ),
                // Button for editing the contact (you can implement this functionality as needed)
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
