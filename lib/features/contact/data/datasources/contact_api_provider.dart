import 'dart:io';

import 'package:dio/dio.dart';
import 'package:std_dev_task/core/network/request_handler.dart';
import 'package:std_dev_task/core/network/urls.dart';

// Provider for interacting with contact-related API endpoints
class ContactApiProvider {
  // Fetches a list of contacts from the API
  Future<dynamic> getContacts() async {
    return await RequestHandler.get(
      path: Urls.contact,
    );
  }

  // Adds a new contact to the API
  Future<dynamic> addContact({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  }) async {
    // Prepare the data to be sent to the API
    Map<String, dynamic>? data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "notes": note,
    };

    // If a picture is provided, include it in the request as a MultipartFile
    if (picture != null) {
      data["picture"] = List.generate(
        1,
        (index) async => await MultipartFile.fromFile(
          picture.path,
          filename: picture.path.split('/').last,
        ),
      );
    }

    // Send a POST request to add the contact
    return RequestHandler.post(path: Urls.contact, data: data);
  }

  // Fetches a single contact by its ID from the API
  Future<dynamic> getOneContact(String id) async {
    return await RequestHandler.get(
      path: "${Urls.contact}/$id",
    );
  }

  // Deletes a contact by its ID from the API
  Future<dynamic> deleteContact(String id) async {
    return await RequestHandler.delete(
      path: "${Urls.contact}/$id",
    );
  }
}
