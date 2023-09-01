import 'dart:io';

import 'package:dio/dio.dart';
import 'package:std_dev_task/core/network/request_handler.dart';
import 'package:std_dev_task/core/network/urls.dart';

class ContactApiProvider {
  Future getContacts() async {
    return await RequestHandler.get(
      path: Urls.contact,
    );
  }

  Future<dynamic> addContact({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  }) async {
    Map<String, dynamic>? data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "notes": note,
    };

      if (picture != null) {
      data["picture"] = List.generate(
          1,
          (index) async => await MultipartFile.fromFile(picture.path,
              filename: picture.path.split('/').last));
    }

    return RequestHandler.post(path: Urls.contact, data: data);
  }
}
