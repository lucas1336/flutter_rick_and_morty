import 'package:flutter/material.dart';
import 'package:flutter_rick_andmorty/model/character_model.dart';
import 'package:flutter_rick_andmorty/provider/api_provider.dart';
import 'package:flutter_rick_andmorty/screens/character_screen.dart';
import 'package:flutter_rick_andmorty/widgets/navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const AppNavigation();
      },
      routes: [
        GoRoute(
          path: 'character',
          builder: (context, state) {
            final character = state.extra as Character;
            return CharacterScreen(character: character);
          },
        )
      ])
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => ApiProvider(),
        child: MaterialApp.router(
          title: 'Rick and Morty App',
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
