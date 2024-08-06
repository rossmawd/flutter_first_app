import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<dynamic> hiddenContent = [
  "alice",
  "bob",
  "carol",
  "dave",
  "eve",
  "frank",
  "grace",
  "heidi",
  "alice",
  "bob",
  "carol",
  "dave",
  "eve",
  "frank",
  "grace",
  "heidi"
];


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Match',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cat Match Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> selectedTiles = [];
  List<dynamic> completedTiles = [];

  void handleClick(int index) {

    if (selectedTiles.contains(index) || completedTiles.contains(index)) {
      return;
    }
    setState(() {
      selectedTiles = List.from(selectedTiles)..add(index);
    });

    if (selectedTiles.length == 2) {
      if (hiddenContent[selectedTiles[0]] == hiddenContent[selectedTiles[1]]) {
        setState(() {
          completedTiles = List.from(completedTiles)..addAll(selectedTiles);
        });
      }

      setState(() {
        selectedTiles = [];
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
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
            isSelected:
                selectedTiles.contains(index) || completedTiles.contains(index),
          );
        },
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final void Function(int) handleClick;
  final int index;
  final bool isSelected;

  const TileWidget({
    Key? key,
    required this.handleClick,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String hiddenString = isSelected ? hiddenContent[index] : '$index';
    return InkWell(
      onTap: () => handleClick(index),
      highlightColor: Theme.of(context).colorScheme.secondary,
      splashColor: Theme.of(context).colorScheme.tertiaryFixed,
      child: Ink(
        color:
            isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        child: Center(
          child: Text(
            hiddenString,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
