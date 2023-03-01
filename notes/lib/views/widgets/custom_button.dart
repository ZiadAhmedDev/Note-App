import 'package:flutter/material.dart';

import '../../constants/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.validator,
  });
  final void Function()? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: kPrimaryColor),
        child: TextButton(
          onPressed: validator,
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
