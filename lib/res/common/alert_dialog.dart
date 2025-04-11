import 'package:flutter/material.dart';

void showConfirmDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder:
        (ctx) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
                onConfirm();
              },
            ),
          ],
        ),
  );
}
