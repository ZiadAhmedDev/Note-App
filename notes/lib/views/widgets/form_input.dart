import 'package:flutter/cupertino.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomInputTextBuilder(
              color: kPrimaryColor,
              hint: 'Title',
              onSave: (value) => title = value,
              autoValidate: autoValidate,
            ),
            const SizedBox(height: 30),
            CustomInputTextBuilder(
              color: kPrimaryColor,
              hint: 'Content',
              maxLine: 5,
              onSave: (value) => subTitle = value,
              autoValidate: autoValidate,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            CustomButton(
              validator: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  NoteModel note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateTime.now().toString(),
                      color: Colors.orange.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(note);
                } else {
                  setState(() {
                    autoValidate = AutovalidateMode.always;
                  });
                }
              },
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
