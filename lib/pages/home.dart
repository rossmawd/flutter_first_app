import 'package:flutter/material.dart';
import 'dart:math';
import '../data/assets_data.dart';
import '../utils/game_logic.dart';
import '../widgets/tile_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> selectedTiles = [];
  List<int> completedTiles = [];
  int score = 100;

  @override
  void initState() {
    super.initState();
    hiddenContent.shuffle(Random());
  }


  void handleClick(int index) {
    final GameState newState = handleTileClick(
      hiddenContent: hiddenContent,
      selectedTiles: selectedTiles,
      completedTiles: completedTiles,
      index: index,
      score: score,
    );

    setState(() {
      selectedTiles = newState.selectedTiles;
      completedTiles = newState.completedTiles;
      score = newState.score;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Number of columns
              crossAxisSpacing: 4.0, // Spacing between columns
              mainAxisSpacing: 4.0, // Spacing between rows
            ),
            itemCount: 16, // Number of items (5x5 grid)
            itemBuilder: (context, index) {
              return TileWidget(
                handleClick: handleClick,
                index: index,
                isSelected: selectedTiles.contains(index) ||
                    completedTiles.contains(index),
              );
            },
          ),
          if (completedTiles.length == 16)
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedTiles = [];
                    completedTiles = [];
                    hiddenContent.shuffle(Random());
                    score = 100;
                  });
                },
                child: Text('completed with score $score/100. Play again?'),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            selectedTiles = [];
            completedTiles = [];
            hiddenContent.shuffle(Random());
            score = 100;
          });
        },
      ),
    );
  }
}
