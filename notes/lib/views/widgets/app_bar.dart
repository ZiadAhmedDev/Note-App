import 'package:flutter/material.dart';
import 'package:notes/views/widgets/search.dart';

class AppBarBuilder extends StatelessWidget {
  const AppBarBuilder({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          const Spacer(),
          CustomSearchIcon(icon: icon),
        ],
      ),
    );
  }
}
