import 'package:flutter/material.dart';
import 'package:ktnotes/common/extensions/context_extensions.dart';
import 'package:ktnotes/ui/widgets/notes_item/notes_items.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content,
      bottomNavigationBar: _bottomBar,
    );
  }

  Widget get _content => Builder(builder: (context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: 20,
          itemBuilder: (_, index) {
            return const NotesItem();
          },
        )
      ],
    );
  });

  Widget get _bottomBar => Builder(builder: (context) {
        return SafeArea(
          child: Container(
            height: 70,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.timelapse_rounded),
                Container(
                  width: 44,
                  height: 44,
                  child: Icon(
                    Icons.add_rounded,
                    color: context.color.surface,
                  ),
                  decoration: BoxDecoration(
                    color: context.color.onSurface,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Icon(Icons.data_usage_rounded),
              ],
            ),
          ),
        );
      });
}
