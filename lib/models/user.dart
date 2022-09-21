import 'package:flutter/material.dart';

import 'company.dart';

class User {
  String? username;
  String? name;
  String? email;
  String? phone;
  String? website;
  Company? company;

  User(
      {this.username,
      this.name,
      this.email,
      this.phone,
      this.website,
      this.company});
}
