import 'package:std_dev_task/features/contact/data/datasources/contact_api_provider.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';
import 'package:std_dev_task/core/network/data_status.dart';
import 'package:std_dev_task/features/contact/domain/repositories/contact_repository.dart';

import '../models/contact_model.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactApiProvider apiProvider;

  ContactRepositoryImpl(this.apiProvider);

  @override
  Future<DataSatus<List<ContactEntity>>> getContacts() async {
    try {
      var result = await apiProvider.getContacts();
      if (result is String) {
        return DataFailed(result);
      } else {
        return DataSuccess(
            List.from((result as List).map((e) => ContactModel.fromJson(e))));
      }
    } catch (e) {
      return const DataFailed(
          "something went wrong. please check your internet");
    }
  }
}
