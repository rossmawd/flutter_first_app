class GameState {
  final List<int> selectedTiles;
  final List<int> completedTiles;
  final int score;
  final bool clearSelected;


  GameState({
    required this.selectedTiles,
    required this.completedTiles,
    required this.score,
    this.clearSelected = false,
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
    );
  }

  var newSelectedTiles = List<int>.from(selectedTiles);
  var newCompletedTiles = List<int>.from(completedTiles);
  var newScore = score;
  var clearSelected = false;

  if (newSelectedTiles.length >= 2) {
    newSelectedTiles.clear();
  }

  newSelectedTiles.add(index);

  if (newSelectedTiles.length == 2) {
    if (hiddenContent[newSelectedTiles[0]] ==
        hiddenContent[newSelectedTiles[1]]) {
      newCompletedTiles.addAll(newSelectedTiles);
    } else {
      newScore -= 1;
      clearSelected = true; 
    }
  }

  return GameState(
    selectedTiles: newSelectedTiles,
    completedTiles: newCompletedTiles,
    score: newScore,
    clearSelected: clearSelected,
  );
}
