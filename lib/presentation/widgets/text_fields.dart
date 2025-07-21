import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField(this._controller, {super.key});

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      //style: TextStyle(color: Colors.white),
      //cursorColor: Colors.white,
      textAlignVertical: TextAlignVertical.center,
      //scrollPadding: EdgeInsets.all(0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,

        hintText: 'タイトル',

        //contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),
        border: OutlineInputBorder(
          borderRadius: AppRadius.all,
          borderSide: BorderSide.none,
        ),
        //hintStyle: Theme.of(context).textTheme.bodyMedium,
        isDense: true,
      ),

      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      minLines: 1,
      maxLines: 3,
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField(this._controller, {super.key});

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      //style: TextStyle(color: Colors.white),
      //cursorColor: Colors.white,
      textAlignVertical: TextAlignVertical.center,
      //scrollPadding: EdgeInsets.all(0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,

        hintText: '詳細',

        //contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        //hintStyle: Theme.of(context).textTheme.bodyMedium,
        isDense: true,
      ),

      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      minLines: 2,
      maxLines: 8,
    );
  }
}

class SubTaskTextField extends StatelessWidget {
  const SubTaskTextField(this._controller, {super.key});

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: _controller,
      //style: TextStyle(color: Colors.white),
      //cursorColor: Colors.white,
      textAlignVertical: TextAlignVertical.center,
      //scrollPadding: EdgeInsets.all(0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,

        hintText: 'やることを入力',

        //contentPadding: EdgeInsets.fromLTRB(4, 4, 4, 4),
        border: OutlineInputBorder(
          borderRadius: AppRadius.all,
          borderSide: BorderSide.none,
        ),
        //hintStyle: Theme.of(context).textTheme.bodyMedium,
        isDense: true,
      ),

      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      minLines: 1,
      maxLines: 1,
    );
  }
}
