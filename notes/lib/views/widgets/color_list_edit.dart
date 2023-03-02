import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes/cubit/note_view/cubit/note_view_cubit.dart';
import 'package:notes/model/note_model.dart';

import '../../constants/const.dart';
import 'color_list_view.dart';

class ColorListEdit extends StatefulWidget {
  ColorListEdit({super.key, required this.color, required this.note});
  int color;
  NoteModel note;

  @override
  State<ColorListEdit> createState() => _ColorListEditState();
}

class _ColorListEditState extends State<ColorListEdit> {
  int currentIndex = -1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29 * 2,
      width: 29 * 2 * 10,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.color = colorList[index].value;
                  widget.note.color = colorList[index].value;
                  widget.note.save();
                  NoteViewCubit.get(context).fetchNoteView();
                });
              },
              child: ColorItem(
                  isClicked: index ==
                      colorList.indexWhere((element) =>
                          element.value == Color(widget.color).value),
                  color: colorList[index]),
            );
          }),
    );
  }
}
