import 'package:flutter/material.dart';

class Validation {
  final BuildContext context;
  const Validation({required this.context});

  String? requiredField(value) =>
      value.isEmpty ? "This field is required" : null;

  String? password(value) {
    return value.isEmpty
        ? "This field is required"
        : value.length < 6
            ? 'must be greater than 6 charachters'
            : null;
  }

  String? cvv(value) {
    return value.isEmpty
        ? "This field is required"
        : value.length < 3
            ? 'must be 3 digits'
            : null;
  }

  String? pin(value) {
    return value.isEmpty
        ? "This field is required"
        : value.length < 16
            ? 'must be equal 16 digits'
            : null;
  }

  String? email(value) {
    var emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(emailPattern);
    return value.isEmpty
        ? "This field is required"
        : (!regex.hasMatch(value))
            ? 'Enter valide email'
            : null;
  }

  String? url(value) {
    var urlPattern =
        r'^((https?|ftp|file)://)?[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]$';
    RegExp regex = new RegExp(urlPattern);
    return value.isEmpty
        ? "This field is required"
        : (!regex.hasMatch(value))
            ? 'Enter valide url'
            : null;
  }
}
