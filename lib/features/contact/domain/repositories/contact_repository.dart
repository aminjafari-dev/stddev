import 'dart:io';
import 'package:std_dev_task/core/network/data_status.dart';
import '../entities/contact_entity.dart';

abstract class ContactRepository {
  // get methode
  Future<DataStatus<List<ContactEntity>>> getContacts();
  Future<DataStatus<ContactEntity>> getOneContact(String id);
  Future<DataStatus<bool>> deleteContact(String id);
  Future<DataStatus<ContactEntity>> updateContact(String id);

// post methode
  Future<DataStatus<ContactEntity>> addContact(
      {required String firstName,
      required String lastName,
      required String phone,
      required String email,
      required String note,
      File? picture});
}
