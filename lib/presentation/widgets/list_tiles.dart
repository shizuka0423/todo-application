import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_application/domain/features/datetime_ext.dart';
import 'package:flutter_todo_application/domain/types/importance.dart';
import 'package:flutter_todo_application/domain/types/regularly.dart';
import 'package:flutter_todo_application/domain/types/tag.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/icons.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:tuple/tuple.dart';

ListTile notificationList(Color color) {
  return ListTile(
    tileColor: color,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.top),
    minTileHeight: 24,
    leading: AppIcons.notice,
    title: Text('通知'),
  );
}

ListTile regularlyList(Color color) {
  return ListTile(
    tileColor: color,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.bottom),
    minTileHeight: 24,
    //dense: true,
    leading: AppIcons.repeat,
    title: Text('繰り返し'),
  );
}

// ListTile tagList(Color color, List<Tag> tags, int isTags) {
//   return ListTile(
//     onTap: () {},
//     shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
//     minTileHeight: 24,
//     tileColor: color,
//     leading: AppIcons.tag,
//     title: Text('ラベル'),
//     trailing: Text(
//       tags
//           .firstWhere(
//             (tag) => tag.id == isTags,
//             orElse: () => tags.firstWhere((tag) => tag.id == 1),
//           )
//           .name,
//     ),
//   );
// }

ListTile importanceList(Color color, int importance) {
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
    minTileHeight: 24,
    tileColor: color,
    leading: AppIcons.star,
    title: Text('重要度'),
    trailing: Text(Importance.none.name),
    /*SizedBox(
      width: 120, // ← 必要に応じて調整
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [Text(Importance.none.name), Icon()],
      ),
    ),*/
  );
}

// class NotificationTile extends StatelessWidget {
//   const NotificationTile(this._checked, this._onChanged, {super.key});

//   final bool _checked;
//   final ValueChanged<bool> _onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       tileColor: Theme.of(context).colorScheme.surface,
//       shape: RoundedRectangleBorder(borderRadius: AppRadius.top),
//       minTileHeight: AppSize.tile2,
//       leading: AppIcons.notice,
//       title: Text('通知'),
//       trailing: CupertinoSwitch(
//         value: _checked,
//         onChanged: (value) => _onChanged(value),
//       ),
//     );
//   }
// }

class ImportanceTile extends StatelessWidget {
  const ImportanceTile(this._index, this._onChanged, {super.key});

  final int _index;
  final ValueChanged<int> _onChanged;

  @override
  Widget build(BuildContext context) {
    final importance = Importance.values;
    return InkWell(
      borderRadius: AppRadius.all,
      onTapDown: (details) {
        final position = details.globalPosition;
        showMenu(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
          position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
          context: context,
          items:
              importance
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          IconTheme(
                            data: IconThemeData(color: e.color),
                            child: AppIcons.flag,
                          ),
                          Text(e.name),
                        ],
                      ),
                    ),
                  )
                  .toList(),
          elevation: 8,
        ).then((value) {
          //value != null ? _onChanged(value.index):null,
          if (value != null) _onChanged(value.index);
        });
      },
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
        //visualDensity: VisualDensity.compact,
        minTileHeight: AppSize.tile2,
        tileColor: Theme.of(context).colorScheme.surface,
        leading: AppIcons.flag,
        title: Text('優先度'),
        trailing:
        //Text(importance[_index].name, style: AppText.trailing),
        IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(importance[_index].name, style: AppText.trailing),
              AppIcons.upDown,
            ],
          ),
        ),
      ),
    );
  }
}

class RegularlyTile extends StatelessWidget {
  const RegularlyTile(this._index, this._onChanged, {super.key});

  final int _index;
  final ValueChanged<int> _onChanged;

  @override
  Widget build(BuildContext context) {
    final regularly = Regularly.values;
    return InkWell(
      borderRadius: AppRadius.bottom,
      onTapDown: (details) {
        final position = details.globalPosition;
        showMenu(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
          position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
          context: context,
          items:
              regularly
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child:
                          e.index != _index
                              ? Text(e.name)
                              : Row(children: [AppIcons.check, Text(e.name)]),
                    ),
                  )
                  .toList(),
          elevation: 8,
        ).then((value) {
          if (value != null) _onChanged(value.index);
        });
      },
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.bottom),
        minTileHeight: AppSize.tile2,
        tileColor: Theme.of(context).colorScheme.surface,
        leading: AppIcons.repeat,
        title: Text('繰り返し'),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(regularly[_index].name, style: AppText.trailing),
              AppIcons.upDown,
            ],
          ),
        ), //Text(regularly[_index].name, style: AppText.trailing),
      ),
    );
  }
}

class TagTile extends StatelessWidget {
  const TagTile(this._tags, this._selectedId, this._onChanged, {super.key});
  final List<Tag> _tags;
  final String? _selectedId;
  final ValueChanged<String?> _onChanged;
  @override
  Widget build(BuildContext context) {
    final isName = _getSelectedLabelText();

    //final index = _tags.indexWhere((tag) => tag.id == _selectedId);
    // final isName =
    //     _selectedId == 'none' || index == -1 ? 'なし' : _tags[index].name;

    return ListTile(
      onTap: () async {
        final res = await context.push<String?>(
          '/list/registration/tagSelect',
          extra: Tuple2(_tags, _selectedId),
        );
        _onChanged(res);
      },
      shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
      minTileHeight: AppSize.tile2,
      tileColor: Theme.of(context).colorScheme.surface,
      leading: AppIcons.tag,
      title: Text('ラベル'),
      trailing: Text(isName, style: AppText.trailing),
    );
  }

  String _getSelectedLabelText() {
    if (_selectedId == null) return 'なし';
    final index = _tags.indexWhere((tag) => tag.id == _selectedId);
    return index != -1 ? _tags[index].name : 'なし';
  }
}

class TagColorTile extends StatelessWidget {
  const TagColorTile(this._selectedIndex, {super.key});
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final labelColor = TagColors.values[_selectedIndex];
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.top),
      minTileHeight: AppSize.tile2,
      leading: AppIcons.pallet,
      title: Text('色'),
      trailing: Text(labelColor.name),
    );
  }
}

class DefaultTagTile extends StatelessWidget {
  const DefaultTagTile(this._onTap, this._selectedId, {super.key});

  final VoidCallback _onTap;
  final String? _selectedId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _onTap(),
      minTileHeight: AppSize.tile2,
      tileColor: Theme.of(context).colorScheme.surface,
      leading: SizedBox.shrink(),
      title: Text('なし'),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
      trailing: _selectedId == null ? AppIcons.check : null,
    );
  }
}

class TagSelectTile extends StatelessWidget {
  const TagSelectTile(this._onTap, this._tag, this._selectedId, {super.key});

  final VoidCallback _onTap;
  final Tag _tag;
  final String? _selectedId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _onTap(),
      minTileHeight: AppSize.tile2,
      tileColor: Theme.of(context).colorScheme.surface,
      leading: Icon(
        color: Color(TagColors.values[_tag.color].color),
        IconDatas.tag,
      ),
      title: Text(_tag.name),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.all),
      trailing: _tag.id == _selectedId ? AppIcons.check : null,
    );
  }
}
