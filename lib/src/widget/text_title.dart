import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, @required this.description}) : super(key: key);
  final description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}

class ProcessText extends StatelessWidget {
  const ProcessText({Key? key, @required this.text}) : super(key: key);
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.grey.shade800,
      ),
    );
  }
}
