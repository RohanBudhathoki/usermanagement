import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/res/common/page_animation.dart';
import 'package:usermanagerapp/utils/loader/loader.dart';
import 'package:usermanagerapp/view/add_user/add_user.dart';
import 'package:usermanagerapp/view/home_screen/search_screen.dart';
import 'package:usermanagerapp/view/home_screen/widget/user_card.dart';
import 'package:usermanagerapp/view/user_profile/user_profile.dart';

import 'package:usermanagerapp/view_models/user_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                AnimatedPageTransition.createRoute(
                  SearchScreen(users: usersAsync),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: usersAsync.length,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GestureDetector(
              onTap: () async {
                print(usersAsync[index].avatarImageProvider);
                Navigator.push(
                  context,
                  AnimatedPageTransition.createRoute(
                    UserProfileScreen(usersAsync[index]),
                  ),
                );
              },
              child: CommonUserCard(
                backgroundImage: usersAsync[index].avatarImageProvider,
                firstName: usersAsync[index].firstName,
                email: usersAsync[index].email,
                lastName: usersAsync[index].lastName,
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            AnimatedPageTransition.createRoute(UserCreationScreen()),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.deepPurple),
      ),
    );
  }
}
