import 'package:dio/dio.dart';

class RequestHandler {
  static Future<dynamic> get({required String path}) async {
    var options = Options(headers: {
      "x-api-key": "",
      "content-type": "",
    });

    try {
      var response = await Dio().get(
        path,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      return e.message;
    }
  }
}
