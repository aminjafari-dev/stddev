import 'dart:io';

import 'package:std_dev_task/core/network/request_handler.dart';
import 'package:std_dev_task/core/network/urls.dart';

class ContactApiProvider {
  Future getContacts<T>() async {
    return RequestHandler.get(
      path: Urls.contact,
    );
  }

  Future<dynamic> addContact({
    File? file,

  }) async {
    return RequestHandler.post(path: Urls.contact, file: file,);
  }
}
