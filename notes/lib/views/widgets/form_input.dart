import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubit/add_note/add_note_cubit.dart';
import 'package:notes/model/note_model.dart';
import '../../constants/const.dart';
import '../../cubit/note_view/cubit/note_view_cubit.dart';
import 'custom_button.dart';
import 'input_Text_Builder.dart';

class FormInputBuilder extends StatefulWidget {
  const FormInputBuilder({super.key});
  @override
  State<FormInputBuilder> createState() => _FormInputBuilderState();
}

class _FormInputBuilderState extends State<FormInputBuilder> {
  String? title, subTitle;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomInputTextBuilder(
            color: kPrimaryColor,
            hint: 'Title',
            onChange: (value) {
              title = value;
            },
            autoValidate: autoValidate,
          ),
          const SizedBox(height: 10),
          CustomInputTextBuilder(
            color: kPrimaryColor,
            hint: 'Content',
            maxLine: 5,
            onChange: (value) {
              subTitle = value;
            },
            autoValidate: autoValidate,
          ),
          const SizedBox(height: 15),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var format = DateFormat.yMd().format(currentDate);
                  NoteModel note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: format.toString(),
                      color: Colors.orange.value);
                  AddNoteCubit.get(context).addNote(note);
                  NoteViewCubit.get(context).fetchNoteView();
                } else {
                  setState(() {
                    autoValidate = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
