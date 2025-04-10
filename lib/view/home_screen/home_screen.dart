import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/res/common/page_animation.dart';
import 'package:usermanagerapp/utils/loader/loader.dart';
import 'package:usermanagerapp/view/home_screen/search_screen.dart';
import 'package:usermanagerapp/view/home_screen/widget/user_card.dart';
import 'package:usermanagerapp/view/user_profile/user_profile.dart';

import 'package:usermanagerapp/view_models/user_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              usersAsync.whenData((users) {
                Navigator.push(
                  context,
                  AnimatedPageTransition.createRoute(
                    SearchScreen(users: users),
                  ),
                );
              });
            },
          ),
        ],
      ),
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
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        AnimatedPageTransition.createRoute(
                          UserProfileScreen(users[index]),
                        ),
                      );
                    },
                    child: CommonUserCard(
                      backgroundImage: NetworkImage(users[index].avatarUrl),
                      firstName: users[index].firstName,
                      email: users[index].email,
                      lastName: users[index].lastName,
                    ),
                  ),
                );
              },
            ),
        loading: () => Center(child: LoadingWidget()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
