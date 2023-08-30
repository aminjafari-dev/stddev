import 'package:std_dev_task/core/network/data_status.dart';

import '../entities/contact_entity.dart';

abstract class ContactRepository {
  Future<DataSatus<List<ContactEntity>>> getContacts();
}
