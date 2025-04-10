import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/view/user_profile/widget/delete.dart';

class UserProfileScreen extends ConsumerWidget {
  final UserModel user;
  const UserProfileScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff747474),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: [
                  Text("Name"),
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //         radius: 80,
            //         backgroundImage: NetworkImage(user.avatarUrl),
            //       ),
            //       const SizedBox(height: 20),
            //       Text(
            //         "${user.firstName} ${user.lastName}",
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       const SizedBox(height: 10),
            //       Text(user.email),
            //       const SizedBox(height: 10),
            //       Text("ID: ${user.id}"),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
