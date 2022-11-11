import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    Key? key,
    required this.onChanged,
    required this.textFieldController,
  }) : super(key: key);
  final Function(String)? onChanged;
  final TextEditingController textFieldController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: textFieldController,
        onChanged: onChanged,
        cursorColor: Colors.grey.shade700,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 1),
          ),
        ),
      ),
    );
  }
}
