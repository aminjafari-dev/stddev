import 'dart:io';
import 'package:std_dev_task/core/network/data_status.dart';
import '../entities/contact_entity.dart';

abstract class ContactRepository {
  Future<DataSatus<List<ContactEntity>>> getContacts();

  Future<DataSatus<ContactEntity>> addContact(
    {
      required String firstName,
      required String lastName,
      required String phone,
      required String email,
      required String note,
      File? picture
    }
  );
}
