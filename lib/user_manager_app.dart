import 'package:flutter/material.dart';

import 'package:usermanagerapp/view/home_screen/home_screen.dart';

class UserManagerApp extends StatelessWidget {
  const UserManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
