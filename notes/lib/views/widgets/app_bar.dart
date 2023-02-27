import 'package:flutter/material.dart';
import 'package:notes/views/widgets/search.dart';

class AppBarBuilder extends StatelessWidget {
  const AppBarBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            'Note App',
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          CustomSearchIcon(),
        ],
      ),
    );
  }
}
