import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('5x5 Grid'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Number of columns
            crossAxisSpacing: 4.0, // Spacing between columns
            mainAxisSpacing: 4.0, // Spacing between rows
          ),
          itemCount: 25, // Number of items (5x5 grid)
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
