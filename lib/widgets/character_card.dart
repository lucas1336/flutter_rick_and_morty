import 'package:flutter/material.dart';
import 'package:flutter_rick_andmorty/model/character_model.dart';
import 'package:go_router/go_router.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/character', extra: character);
      },
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Hero(
                tag: character.id!,
                child: FadeInImage(
                  image: NetworkImage(character.image!),
                  placeholder: const AssetImage('assets/loading_image.gif'),
                ),
              ),
            ),
            Text(
              character.name!,
              style: const TextStyle(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
