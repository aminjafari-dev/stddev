import 'dart:io';
import 'package:std_dev_task/core/network/data_status.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';

import '../repositories/contact_repository.dart';

class AddContactUsecase {
  final ContactRepository repository;

  AddContactUsecase(this.repository);

  @override
  Future<DataStatus<ContactEntity>> call(
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
