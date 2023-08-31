import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/contact_card.dart';

import '../../../../core/network/data_status.dart';
import '../../domain/entities/contact_entity.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    getContacts();
    super.initState();
  }

  void getContacts() {
    BlocProvider.of<ContactBloc>(context).add(GetContacts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state.contactList is EventLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.contactList is EventCompleted) {
          var data = (state.contactList as EventCompleted).data!
              as List<ContactEntity>;
          return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) {
                return ContactCard(
                  data: data[index],
                );
              },
              separatorBuilder: (c, i) => STDSizedBox.height_12,
              itemCount: data.length);
        }
        if (state.contactList is EventError) {
          return const Center(
            child: Text("something went wrong"),
          );
        }
        return Container();
      },
    ));
  }
}
