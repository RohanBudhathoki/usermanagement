import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/view/home_screen/widget/user_card.dart';
import 'package:usermanagerapp/view_models/user_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('User List')),
      body: usersAsync.when(
        data:
            (users) => ListView.builder(
              itemCount: users.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: CommonUserCard(
                    backgroundImage: NetworkImage(
                      'https://reqres.in/img/faces/8-image.jpg',
                    ),
                    firstName: 'Alex',
                    email: 'Alex.furgerson@gmail.com',
                    lastName: 'furgerson',
                  ),
                );
              },
            ),
        loading: () => CircularProgressIndicator(),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
