import 'package:std_dev_task/core/network/data_status.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';
import 'package:std_dev_task/features/contact/domain/repositories/contact_repository.dart';

class GetContactsUsecase {
  final ContactRepository repository;

  GetContactsUsecase(this.repository);

  @override
  Future<DataStatus<List<ContactEntity>>> call() {
    return repository.getContacts();
  }
}
