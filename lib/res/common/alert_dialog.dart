import 'package:flutter/material.dart';

class CommonAlertDialog extends StatelessWidget {
  final String titleText;
  final String contentText;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirmFn;
  final VoidCallback onCancelFn;

  const CommonAlertDialog({
    super.key,
    required this.titleText,
    required this.contentText,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirmFn,
    required this.onCancelFn,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleText),
      content: Text(contentText),
      actions: <Widget>[
        TextButton(onPressed: onCancelFn, child: Text(cancelButtonText)),

        TextButton(onPressed: onConfirmFn, child: Text(confirmButtonText)),
      ],
    );
  }
}

void showCommonAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String confirmButtonText,
  required String cancelButtonText,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CommonAlertDialog(
        titleText: title,
        contentText: content,
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
        onConfirmFn: onConfirm,
        onCancelFn: onCancel,
      );
    },
  );
}
