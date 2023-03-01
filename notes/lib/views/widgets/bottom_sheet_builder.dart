import 'package:flutter/material.dart';
import 'package:notes/views/widgets/input_Text_Builder.dart';
import '../../constants/const.dart';
import 'custom_button.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .63,
          child: const FormInputBuilder()),
    );
  }
}

class FormInputBuilder extends StatefulWidget {
  const FormInputBuilder({
    super.key,
  });
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
              height: 10,
            ),
            CustomInputTextBuilder(
              color: kPrimaryColor,
              hint: 'Title',
              onSave: (value) => title = value,
              autoValidate: autoValidate,
            ),
            CustomInputTextBuilder(
              color: kPrimaryColor,
              hint: 'Content',
              maxLine: 5,
              onSave: (value) => subTitle = value,
              autoValidate: autoValidate,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              validator: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  setState(() {
                    autoValidate = AutovalidateMode.always;
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
