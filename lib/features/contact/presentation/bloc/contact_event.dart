part of 'contact_bloc.dart';

// Abstract base class for contact-related events
abstract class ContactEvent extends Equatable {}

// Event for fetching the list of contacts
class GetContactsEvent extends ContactEvent {
  @override
  List<Object?> get props => [];
}

// Event for adding a new contact
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

// Event for deleting a contact
class DeleteContactEvent extends ContactEvent {
  final String id;

  DeleteContactEvent(this.id);

  @override
  List<Object?> get props => [id];
}
