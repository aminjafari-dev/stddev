import 'package:std_dev_task/core/network/data_status.dart';
import 'package:std_dev_task/core/usecase/usecases.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';
import 'package:std_dev_task/features/contact/domain/repositories/contact_repository.dart';

class GetContactsUsecase extends Usecase<DataSatus<List<ContactEntity>>> {
  final ContactRepository repository;

  GetContactsUsecase(this.repository);
  
  @override
  Future<DataSatus<List<ContactEntity>>> call() {
    return repository.getContacts();
  }

}
