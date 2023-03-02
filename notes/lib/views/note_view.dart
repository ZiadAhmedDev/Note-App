import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/views/widgets/app_bar.dart';
import 'package:notes/views/widgets/bottom_sheet_builder.dart';
import 'package:notes/views/widgets/note_items_list.dart';

import '../cubit/note_view/cubit/note_view_cubit.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                context: context,
                builder: (context) {
                  return const BottomSheetBuilder();
                });
          },
          child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            AppBarBuilder(icon: Icons.search, title: 'Note app'),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: NoteItemList(),
            )),
          ],
        ),
      ),
    );
  }
}
