class GameState {
  final List<int> selectedTiles;
  final List<int> completedTiles;
  final int score;

  GameState({
    required this.selectedTiles,
    required this.completedTiles,
    required this.score,
  });
}

GameState handleTileClick({
  required List<String> hiddenContent,
  required List<int> selectedTiles,
  required List<int> completedTiles,
  required int index,
  required int score,
}) {
  if (selectedTiles.contains(index) || completedTiles.contains(index)) {
    return GameState(
      selectedTiles: selectedTiles,
      completedTiles: completedTiles,
      score: score,
    ); // No change
  }

  var newSelectedTiles = List<int>.from(selectedTiles);
  var newCompletedTiles = List<int>.from(completedTiles);
  var newScore = score;

  if (selectedTiles.length >= 2) {
    newSelectedTiles.clear();
  }

  newSelectedTiles.add(index);

  if (newSelectedTiles.length == 2) {
    if (hiddenContent[newSelectedTiles[0]] ==
        hiddenContent[newSelectedTiles[1]]) {
      newCompletedTiles.addAll(newSelectedTiles);
    } else {
      newScore -= 1;
    }
  }

  return GameState(
    selectedTiles: newSelectedTiles,
    completedTiles: newCompletedTiles,
    score: newScore,
  );
}
