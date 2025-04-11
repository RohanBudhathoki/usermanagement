import 'dart:io';

import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatarUrl: map['avatar'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatarUrl': avatarUrl,
    };
  }

  bool get isLocalAvatar =>
      avatarUrl.startsWith('/') || avatarUrl.startsWith('file:/');

  ImageProvider get avatarImageProvider {
    return isLocalAvatar ? FileImage(File(avatarUrl)) : NetworkImage(avatarUrl);
  }
}
