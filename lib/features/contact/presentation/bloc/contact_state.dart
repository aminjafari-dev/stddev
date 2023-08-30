part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final EventStatus contactList;

  const ContactState({required this.contactList});

  ContactState copyWith({EventStatus? contactList}) {
    return ContactState(contactList: contactList ?? this.contactList);
  }

  @override
  List<Object> get props => [];
}
