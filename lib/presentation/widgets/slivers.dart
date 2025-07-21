import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/sizes.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';

SliverPadding sliverTitle(String title) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: RawSize.p24),
    sliver: SliverToBoxAdapter(child: Text(title, style: AppText.bodyM)),
  );
}
