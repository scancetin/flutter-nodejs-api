import 'package:flutter/material.dart';
import 'package:flutter_api/services/service.dart';
import '../components/character_card_widget.dart';
import '../models/characters.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<Chars> chars;

  @override
  void initState() {
    chars = getJsonDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
      ),
      body: FutureBuilder<Chars>(
          future: chars,
          builder: (context, chars) {
            if (chars.hasData) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                    itemCount: chars.data!.count,
                    itemBuilder: ((context, index) {
                      return CharacterCardWidget(char: chars.data!.results[index]);
                    }),
                  ),
                ],
              );
            } else if (chars.hasError) {
              print(chars.error.toString());
              return const CircularProgressIndicator();
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
