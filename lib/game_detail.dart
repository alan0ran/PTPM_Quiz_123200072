import 'dart:ui';

import 'package:flutter/material.dart';
import 'game_store.dart';

class GameDetail extends StatefulWidget {
  final GameStore games;
  const GameDetail({ Key? key, required this.games }) : super(key: key);

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.games.name}'),
          actions: [
            IconButton(
                onPressed: () {
                  print(widget.games.linkStore);
                },
                icon: const Icon(Icons.share))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        '${widget.games.name}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.games.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              widget.games.imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description: ${widget.games.about}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.money),
                            Text(
                              '${widget.games.price}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.star),
                            Text(
                              '${widget.games.reviewAverage}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              '${widget.games.reviewCount}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.access_time),
                            Text(
                              '${widget.games.releaseDate}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}