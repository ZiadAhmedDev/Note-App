import 'package:flutter/material.dart';
import '../../constants/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.validator, required this.isLoading});
  final void Function()? validator;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: kPrimaryColor),
        child: TextButton(
          onPressed: validator,
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child:
                      CircularProgressIndicator(color: kDefaultIconDarkColor))
              : const Text(
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
