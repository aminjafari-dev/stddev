part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {}

class GetContactsEvent extends ContactEvent {
  @override
  List<Object?> get props => [];
}

class AddContactEvent extends ContactEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String note;
  final File? picture;

  AddContactEvent({
   required this.firstName,
   required this.lastName,
   required this.email,
   required this.phone,
   required this.note,
   required this.picture,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        note,
        picture,
      ];
}
