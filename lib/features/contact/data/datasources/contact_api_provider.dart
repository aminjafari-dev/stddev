import 'package:std_dev_task/core/network/request_handler.dart';
import 'package:std_dev_task/core/network/urls.dart';

class ContactApiProvider {
  Future<dynamic> getContacts() async {
    
    return RequestHandler.get(
      path: Urls.contact,
    );
  }
}
