import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/cubit/add_note/add_note_cubit.dart';
import '../../constants/components.dart';
import 'form_input.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          print('fail');
        }
        if (state is AddNoteSuccess) {
          Get.back();
          showSnackBar('Adding Note', 'Your note is now saved',
              const Duration(seconds: 3));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoading ? true : false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * .63,
                child: const FormInputBuilder()),
          ),
        );
      },
    );
  }
}
