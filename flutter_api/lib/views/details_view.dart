import 'package:flutter/material.dart';
import '../components/detail_text_widget.dart';
import '../models/details.dart';

class DetailsView extends StatelessWidget {
  final Details char;
  const DetailsView({Key? key, required this.char}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Character Details'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  char.image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 10),
                  child: Column(
                    children: [
                      DetailTextWidget(title: "Name", detail: char.name),
                      DetailTextWidget(title: "Status", detail: char.status),
                      DetailTextWidget(title: "Species", detail: char.species),
                      DetailTextWidget(title: "Type", detail: char.type),
                      DetailTextWidget(title: "Gender", detail: char.gender),
                      DetailTextWidget(title: "Origin", detail: char.origin),
                      DetailTextWidget(title: "Location", detail: char.location),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
