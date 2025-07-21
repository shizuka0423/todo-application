import 'package:flutter/material.dart';

class BottomSheetPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final String? barrierLabel;
  final CapturedThemes? themes;
  final WidgetBuilder builder;
  final BoxConstraints? constraints;

  const BottomSheetPage({
    required this.builder,
    this.anchorPoint,
    this.barrierLabel,
    this.themes,
    this.constraints,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      //backgroundColor: Theme.of(context).colorScheme.secondary,
      settings: this,
      constraints: constraints,
      builder: builder,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1.0,
    );
  }
}
