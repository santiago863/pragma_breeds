import 'package:flutter/material.dart';

class MessageUtils {
  final BuildContext context;

  MessageUtils(
    this.context,
  );

  void showSnackBar(
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }
}
