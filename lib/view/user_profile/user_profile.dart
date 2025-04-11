import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/res/common/alert_dialog.dart';
import 'package:usermanagerapp/res/common/page_animation.dart';
import 'package:usermanagerapp/view_models/user_viewmodel.dart';

class UserProfileScreen extends ConsumerWidget {
  final UserModel user;
  const UserProfileScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Profile'),
        actions: [
          IconButton(
            onPressed: () {
              showConfirmDialog(
                content: 'Are you sure you want to delete this user ?',
                context: context,
                onConfirm: () async {
                  await ref.read(userListProvider.notifier).delteUser(user.id);
                  Navigator.pop(context);
                },
                title: 'Remove User',
              );
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: user.avatarImageProvider,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Text(
                      user.email,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 2),
          Text('About Me'),
        ],
      ),
    );
  }
}
