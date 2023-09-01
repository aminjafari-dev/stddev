// Flutter imports
import 'package:flutter/material.dart';

// Bloc imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:std_dev_task/features/contact/presentation/pages/add_contact_page.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/contact_card.dart';
import '../../domain/entities/contact_entity.dart';

// Represents the page displaying a list of contacts
class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    // Initialize by fetching contacts
    getContacts();
    super.initState();
  }

  // Dispatches a contact retrieval event to the bloc
  void getContacts() {
    BlocProvider.of<ContactBloc>(context).add(GetContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state.contactList is EventLoading) {
            // Display loading indicator while fetching contacts
            return const Center(child: CircularProgressIndicator());
          }
          if (state.contactList is EventCompleted) {
            var data = (state.contactList as EventCompleted).data!
                as List<ContactEntity>;

            // Display the list of contacts using ListView.separated
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) {
                return ContactCard(
                  data: data[index],
                  onTap: () {
                    // ContactApiProvider().getOneContact(data[index].id!);
                    Navigator.pushNamed(
                      context,
                      "/contact_details",
                      arguments: data[index],
                    );
                  },
                );
              },
              separatorBuilder: (c, i) => STDSizedBox.height_12,
              itemCount: data.length,
            );
          }
          if (state.contactList is EventError) {
            // Display an error message if contact retrieval fails
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return Container(); // Empty container if none of the above cases
        },
      ),

      // The button for go to the add contact page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var rout = MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<ContactBloc>(context),
              child: AddContactPage(),
            ),
          );
          Navigator.push(context, rout);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
}
