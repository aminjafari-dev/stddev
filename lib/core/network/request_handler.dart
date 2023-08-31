import 'dart:io';

import 'package:dio/dio.dart';
import 'package:std_dev_task/core/utils/constants.dart';

class RequestHandler {
  static final Map<String, dynamic> _header = {
    'x-api-key': Constants.apiKey,
    'Content-Type': 'application/json; charset=UTF-8',
  };

  
  static Future<dynamic> get({required String path}) async {
    var options = Options(headers: _header);

    try {
      var response = await Dio().get(
        path,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  static Future<dynamic> post({
    required String path,
    File? file,
  }) async {
    var options = Options(headers: _header);

    try {
      var data;
      if (file != null) {
        data = FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path, filename: "image"),
        });
      }

      var response = await Dio().post(
        path,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
