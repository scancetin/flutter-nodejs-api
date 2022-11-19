import 'package:flutter/material.dart';

class DetailTextWidget extends StatelessWidget {
  const DetailTextWidget({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text("$title:    $detail"),
    );
  }
}