import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/add_note/add_note_cubit.dart';
import 'package:notes/model/note_model.dart';
import '../../constants/const.dart';
import 'custom_button.dart';
import 'input_Text_Builder.dart';

class FormInputBuilder extends StatefulWidget {
  const FormInputBuilder({super.key});
  @override
  State<FormInputBuilder> createState() => _FormInputBuilderState();
}

String? title, subTitle;

class _FormInputBuilderState extends State<FormInputBuilder> {
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
            onSave: (value) => title = value,
            autoValidate: autoValidate,
          ),
          const SizedBox(height: 10),
          CustomInputTextBuilder(
            color: kPrimaryColor,
            hint: 'Content',
            maxLine: 5,
            onSave: (value) => subTitle = value,
            autoValidate: autoValidate,
          ),
          const SizedBox(height: 15),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              validator: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  NoteModel note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateTime.now().toString(),
                      color: Colors.orange.value);
                  AddNoteCubit.get(context).addNote(note);
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
