import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;

  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content:
          Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
      actions: actions,
    );
  }

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    List<Widget> actions = const [],
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog(
          title: title,
          message: message,
          actions: actions,
        );
      },
    );
  }
}
