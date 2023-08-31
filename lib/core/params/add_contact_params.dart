import 'dart:io';

class AddContactParams {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String note;
  final File? picture;

  AddContactParams(this.firstName, this.lastName, this.phone, this.email, this.note, this.picture);
}
