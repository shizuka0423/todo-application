import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:go_router/go_router.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    const icon = Icon(CupertinoIcons.slider_horizontal_3);
    return IconButton(onPressed: () {}, icon: icon);
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: AppIcons.search);
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton(this._onTap, this._content, {super.key});

  final VoidCallback _onTap;
  final String _content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: AppSize.tile2,
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
      onTap: () => _onTap(),
      title: Text(
        _content,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

class TagListButton extends StatelessWidget {
  const TagListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.push('/list/tagList'),
      icon: AppIcons.tag,
    );
  }
}
