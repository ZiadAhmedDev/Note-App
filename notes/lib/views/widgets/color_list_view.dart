import 'package:flutter/material.dart';
import 'package:TheNote/cubit/add_note/add_note_cubit.dart';
import 'package:TheNote/cubit/note_view/cubit/note_view_cubit.dart';
import 'package:TheNote/model/note_model.dart';
import '../../constants/const.dart';

class ColorList extends StatefulWidget {
  ColorList({super.key});
  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
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
                  currentIndex = index;
                  AddNoteCubit.get(context).color = colorList[index];
                  NoteViewCubit.get(context).fetchNoteView();
                });
              },
              child: ColorItem(
                  isClicked: currentIndex == index, color: colorList[index]),
            );
          }),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isClicked,
    required this.color,
  });
  final bool isClicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isClicked
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: color,
          );
  }
}
