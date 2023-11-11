import 'package:flutter/material.dart';
import 'package:flutter_rick_andmorty/model/character_model.dart';
import 'package:flutter_rick_andmorty/persistence/repository/character_repository.dart';
import 'package:flutter_rick_andmorty/widgets/character_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  CharacterRepository characterRepository = CharacterRepository();
  List<Character> characters = [];

  @override
  initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    final favoriteCharacters = await characterRepository.getAll();

    if (mounted) {
      setState(() {
        characters = favoriteCharacters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: const Text('Your favorites'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: characters.isEmpty
            ? noFavorites()
            : CharacterList(characters: characters),
      ),
    );
  }
}

Widget noFavorites() {
  return const Expanded(
    child: Center(
      child: Text('You have no favorite characters'),
    ),
  );
}

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, required this.characters});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.87,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return CharacterCard(character: character);
      },
    );
  }
}
