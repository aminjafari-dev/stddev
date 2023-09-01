import '../../../../core/network/data_status.dart';
import '../repositories/contact_repository.dart';

class DeleteContactUsecase {
  final ContactRepository repository;

  DeleteContactUsecase(this.repository);

  @override
  Future<DataStatus<bool>> call(String id) {
    return repository.deleteContact(id);
  }
}
