import 'package:dio/dio.dart';

class RequestHandler {
  static Future<dynamic> get({required String path}) async {
    var options = Options(headers: {
      'x-api-key': "62e3e6d11894fe7edea71921",
      'Content-Type': 'application/json; charset=UTF-8',
    });

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
}
