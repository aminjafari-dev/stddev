part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final EventStatus<List<ContactEntity>> contactList;

  const ContactState({required this.contactList});

  @override
  List<Object> get props => [contactList];

  ContactState copyWith({
    EventStatus<List<ContactEntity>>? contactList,
  }) {
    return ContactState(
      contactList: contactList ?? this.contactList,
    );
  }
}
