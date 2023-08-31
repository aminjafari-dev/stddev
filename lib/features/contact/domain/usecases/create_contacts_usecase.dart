import 'dart:io';

import 'package:std_dev_task/core/params/add_contact_params.dart';

import '../repositories/contact_repository.dart';

class CreateContactsUsecase {
  final ContactRepository repository;

  CreateContactsUsecase(this.repository);

  @override
  Future call(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String note,
      File? picture}) {
    return repository.addContact(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      picture: picture,
      note: note,
    );
  }
}
