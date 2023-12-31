import 'dart:convert';

import 'package:std_dev_task/features/contact/domain/entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? notes,
    List<String>? picture,
    String? phone,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          notes: notes,
          picture: picture,
          phone: phone,
        );

  factory ContactModel.fromRawJson(String str) =>
      ContactModel.fromJson(json.decode(str));


  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        notes: json["notes"],
        picture: json["picture"] == null
            ? []
            : List<String>.from(json["picture"]!.map((x) => x)),
        phone: json["phone"],
      );


  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        notes,
        picture,
        phone,
      ];
}
