import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/radius_styles.dart';

class ColorPalletPicker extends StatelessWidget {
  const ColorPalletPicker(
    this._selectedIndex,
    this._onColorSelected, {
    super.key,
  });

  final int _selectedIndex;
  final ValueChanged<int> _onColorSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppRadius.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: SizedBox(
          width: double.infinity,
          //height: 120,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: TagColors.values.length,
            itemBuilder: (context, index) {
              final color = Color(TagColors.values[index].color);
              final isSelectedColor = _selectedIndex == index;
              return GestureDetector(
                onTap: () => _onColorSelected(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child:
                      isSelectedColor
                          ? Center(child: Icon(Icons.check_rounded, size: 20))
                          : SizedBox.shrink(),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
