import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants/bloc_observer.dart';
import 'package:notes/cubit/note_view/cubit/note_view_cubit.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/note_view.dart';

import 'constants/const.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteViewCubit()..fetchNoteView(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NoteView(),
      ),
    );
  }
}
