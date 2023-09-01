import 'package:hive/hive.dart';

part 'auth_hive.g.dart';

@HiveType(typeId: 0)
class AuthHive extends HiveObject {
  @HiveField(0)
  late bool isLoggedIn;

  AuthHive({required this.isLoggedIn});

  // Getter method to retrieve the login status
  bool get isUserLoggedIn {
    return isLoggedIn;
  }

  // Setter method to update the login status
  void setUserLoggedIn(bool value) {
    isLoggedIn = value;
    save(); // Save the updated object to Hive
  }
}
