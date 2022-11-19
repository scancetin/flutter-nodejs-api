import 'package:flutter/material.dart';
import '../models/details.dart';
import '../views/details_view.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    Key? key,
    required this.char,
  }) : super(key: key);

  final Details char;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(char.image),
        title: Text(char.name),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsView(char: char)));
        },
      ),
    );
  }
}
