import 'package:flutter/material.dart';
import 'package:notes/model/note_model.dart';

class CustomInputTextBuilder extends StatefulWidget {
  const CustomInputTextBuilder(
      {required this.color,
      this.hint,
      this.maxLine = 1,
      this.onChange,
      super.key,
      this.autoValidate});
  final Color color;
  final String? hint;
  final int maxLine;
  final void Function(String?)? onChange;
  final AutovalidateMode? autoValidate;

  @override
  State<CustomInputTextBuilder> createState() => _CustomInputTextBuilderState();
}

class _CustomInputTextBuilderState extends State<CustomInputTextBuilder> {
  final TextEditingController? control = TextEditingController();
  final ScrollController _scrollControl = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _scrollControl.animateTo(200,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn);
        });
      },
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: TextFormField(
              scrollController: _scrollControl,
              controller: control,
              onChanged: widget.onChange,
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'This Field is required';
                } else {
                  return null;
                }
              },
              cursorColor: widget.color,
              maxLines: widget.maxLine,
              autovalidateMode: widget.autoValidate,
              style: TextStyle(
                  color: widget.color, fontSize: 16, letterSpacing: 1.3),
              decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(color: widget.color),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.color),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            )),
      ),
    );
  }
}
