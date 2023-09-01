part of 'contact_bloc.dart';

// State class for managing contact-related states
class ContactState extends Equatable {
  final EventStatus<List<ContactEntity>> contactList;
  final EventStatus<ContactEntity> addContact;
  final EventStatus<bool> deleteContact;

  const ContactState({
    required this.contactList,
    required this.addContact,
    required this.deleteContact,
  });

  @override
  List<Object> get props => [contactList, addContact, deleteContact];

  // Method to create a new state instance with updated fields
  ContactState copyWith({
    EventStatus<List<ContactEntity>>? contactList,
    EventStatus<ContactEntity>? addContact,
    EventStatus<bool>? deleteContact,
  }) {
    return ContactState(
      contactList: contactList ?? this.contactList,
      addContact: addContact ?? this.addContact,
      deleteContact: deleteContact ?? this.deleteContact,
    );
  }
}
