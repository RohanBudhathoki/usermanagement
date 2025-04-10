import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/user_manager_app.dart';

void main() {
  runApp(ProviderScope(child: UserManagerApp()));
}
