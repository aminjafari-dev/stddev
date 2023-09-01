import 'dart:io';
import 'package:dio/dio.dart';
import 'package:std_dev_task/features/contact/data/datasources/contact_api_provider.dart';
import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';
import 'package:std_dev_task/core/network/data_status.dart';
import 'package:std_dev_task/features/contact/domain/repositories/contact_repository.dart';
import '../models/contact_model.dart';

// Implementation of the ContactRepository interface
class ContactRepositoryImpl extends ContactRepository {
  final ContactApiProvider apiProvider;

  ContactRepositoryImpl(this.apiProvider);

  // Fetches a list of contacts from the API
  @override
  Future<DataStatus<List<ContactEntity>>> getContacts() async {
    try {
      var result = await apiProvider.getContacts();
      if (result is String) {
        return DataFailed(result);
      } else {
        var resultList = (result as Response).data;
        return DataSuccess(List.from(
            (resultList as List).map((e) => ContactModel.fromJson(e))));
      }
    } catch (e) {
      return const DataFailed(
          "Something went wrong. Please check your internet connection.");
    }
  }

  // Adds a new contact to the API
  @override
  Future<DataStatus<ContactEntity>> addContact({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String note,
    File? picture,
  }) async {
    try {
      Response result = await apiProvider.addContact(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        note: note,
        picture: picture,
      );
      if (result is String) {
        return DataFailed(result.data);
      } else {
        return DataSuccess(ContactModel.fromJson(result.data));
      }
    } catch (e) {
      return const DataFailed(
        "Something went wrong. Please check your internet connection.",
      );
    }
  }

  // Fetches a single contact by its ID from the API
  @override
  Future<DataStatus<ContactEntity>> getOneContact(String id) async {
    try {
      Response result = await apiProvider.getOneContact(id);

      if (result is String) {
        return DataFailed(result.data);
      } else {
        return DataSuccess(result.data);
      }
    } catch (e) {
      return const DataFailed(
          "Something went wrong. Please check your internet connection.");
    }
  }

  // Deletes a contact by its ID from the API
  @override
  Future<DataStatus<bool>> deleteContact(String id) async {
    try {
      Response result = await apiProvider.deleteContact(id);

      if (result is String) {
        return DataFailed(result.data);
      } else {
        return const DataSuccess(true);
      }
    } catch (e) {
      return const DataFailed(
          "Something went wrong. Please check your internet connection.");
    }
  }
}
