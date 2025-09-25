import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const icon = Icon(Icons.edit_outlined);
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
