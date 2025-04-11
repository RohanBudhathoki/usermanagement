import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/res/common/alert_dialog.dart';
import 'package:usermanagerapp/res/common/common_elevated_button.dart';
import 'package:usermanagerapp/res/common/common_textformfield.dart';

import 'package:usermanagerapp/view_models/user_viewmodel.dart';

class UserProfileScreen extends ConsumerWidget {
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final UserModel user;
  UserProfileScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
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
              Text('Rough Edit '),

              Column(
                children: [
                  CommonTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'First name should not be empty';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(v.trim())) {
                        return 'you cant use unsual character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CommonTextField(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'First name should not be empty';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(v.trim())) {
                        return 'you cant use unsual character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CommonTextField(
                    controller: emailController,

                    hintText: 'Email',
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(v.trim())) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16),
                  CommonButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // final avatar = ref.read(avatarImageProvider);
                        await ref
                            .read(userListProvider.notifier)
                            .updateUser(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              id: user.id,
                            );
                        ref.read(userListProvider.notifier).clearImage(ref);
                        Navigator.pop(context);
                      } else {
                        // adding flush bar later
                      }
                    },
                    text: 'Edit Profile',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
