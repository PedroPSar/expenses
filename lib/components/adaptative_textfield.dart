import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() submitForm;
  final String label;
  final TextInputType inputType;

  const AdaptativeTextField({
    Key? key,
    required this.controller,
    required this.submitForm,
    required this.label,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: (_) => submitForm(),
              keyboardType: inputType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: inputType,
            onSubmitted: (_) => submitForm(),
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
