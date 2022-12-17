import 'package:flutter/material.dart';

Future<void> getInfoDialog(BuildContext context, String message) async {
  await showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text('внимание!'),
      content: Text(message),
      actions: [
        ElevatedButton(
          child: const Text('ок'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
