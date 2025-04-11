import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/res/common/common_elevated_button.dart';
import 'package:usermanagerapp/res/common/common_textformfield.dart';
import 'package:usermanagerapp/view_models/user_viewmodel.dart';

class UserCreationScreen extends ConsumerWidget {
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  UserCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarImage = ref.watch(avatarImageProvider);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Add User')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(userListProvider.notifier).pickImage(ref);
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        avatarImage != null ? FileImage(avatarImage) : null,
                    child:
                        avatarImage == null
                            ? Icon(Icons.camera_alt_rounded, size: 40)
                            : null,
                  ),
                ),
                SizedBox(height: 20),
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
                      final avatar = ref.read(avatarImageProvider);
                      await ref
                          .read(userListProvider.notifier)
                          .addUser(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            avatarImage: avatarImage,
                          );
                      ref.read(userListProvider.notifier).clearImage(ref);
                      Navigator.pop(context);
                    } else {
                      // adding flush bar later
                    }
                  },
                  text: 'Create',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
