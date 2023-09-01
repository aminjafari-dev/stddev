import 'package:std_dev_task/features/contact/domain/repositories/contact_repository.dart';

import '../../../../core/network/data_status.dart';
import '../entities/contact_entity.dart';

class GetOneContactUsecase {
  final ContactRepository contactRepository;

  GetOneContactUsecase(this.contactRepository);

  @override
  Future<DataSatus<ContactEntity>> call(String id) {
    return contactRepository.getOneContact(id);
  }
}
