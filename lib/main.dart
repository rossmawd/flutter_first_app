
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Match',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cat Match Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<dynamic> selectedTiles = [];


  void handleClick(int index) {
    setState(() {
      selectedTiles.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
  body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Number of columns
            crossAxisSpacing: 4.0, // Spacing between columns
            mainAxisSpacing: 4.0, // Spacing between rows
          ),
          itemCount: 25, // Number of items (5x5 grid)
          itemBuilder: (context, index) {
          return TileWidget(
              handleClick: handleClick,
              index: index,
              selectedTiles: selectedTiles);
        },
      ),
     
    );
  }
}

class TileWidget extends StatefulWidget {
  final void Function(int) handleClick;
  final int index;
  final List<dynamic> selectedTiles;


  const TileWidget(
      {Key? key,
      required this.handleClick,
      required this.index,
      required this.selectedTiles})
      : super(key: key);

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {



  @override
  Widget build(BuildContext context) {
    bool isClicked = widget.selectedTiles.contains(widget.index);

    return InkWell(
      onTap: () {
        widget.handleClick(widget.index);
      },
      focusColor: Colors.red,
      splashColor: Colors.blue,
      highlightColor: Colors.green,
      child: Ink(
        color: isClicked ? Colors.white : Colors.black,
        child: Center(
          child: Text(
            '${widget.index}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

