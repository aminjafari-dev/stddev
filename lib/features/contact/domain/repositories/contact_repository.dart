import 'dart:io';
import 'package:std_dev_task/core/network/data_status.dart';
import '../entities/contact_entity.dart';

abstract class ContactRepository {
  // get methode 
  Future<DataSatus<List<ContactEntity>>> getContacts();
  Future<DataSatus<ContactEntity>> getOneContact(String id);


// post methode
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
