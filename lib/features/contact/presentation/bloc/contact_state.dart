part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final EventStatus<List<ContactEntity>> contactList;
  final EventStatus<ContactEntity> addContact;

  const ContactState({required this.contactList,required this.addContact});

  @override
  List<Object> get props => [contactList,addContact];

  ContactState copyWith({
    EventStatus<List<ContactEntity>>? contactList,
    EventStatus<ContactEntity>? addContact,
  }) {
    return ContactState(
      contactList: contactList ?? this.contactList,
      addContact: addContact ?? this.addContact,
    );
  }
}
