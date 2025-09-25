import 'package:flutter/material.dart';
import 'package:flutter_todo_application/presentation/theme/colors.dart';
import 'package:flutter_todo_application/presentation/theme/text_styles.dart';
import 'package:flutter_todo_application/presentation/widgets/table_calendar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('today', style: AppText.appBarStyle),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Center(child: TableCalendarScreen()),
            ]),
          ),
        ],
      ),
    );
  }
}
