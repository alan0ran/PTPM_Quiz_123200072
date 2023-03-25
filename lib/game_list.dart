import 'package:flutter/material.dart';
import 'package:tpm_quiz/game_store.dart';
import 'package:tpm_quiz/game_detail.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Game List'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: gameList.length,
            itemBuilder: (context, index) {
              final GameStore game = gameList[index];
              return ListTile(
                leading: Image.network(
                  game.imageUrls[0],
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text('${game.name}'),
                subtitle: Text('${game.about}'),
                trailing: Text('${game.price}'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GameDetail(
                          games: game)));
                },
              );
            }),
      ),
    );
  }
}