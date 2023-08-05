import 'package:tic_tac_toe/models/player.dart';

class Game {
  static const boardlen = 9;
  static const blocsize = 100.0;
  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardlen, (index) => Player.empty);

  bool winnercheck(
      String player, int index, List<int> scoreboard, int gridsize) {
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;
    scoreboard[row] += score;
    scoreboard[gridsize + col] += score;
    if (row == col) scoreboard[2 * gridsize] += score;
    if (gridsize - 1 - col == row) scoreboard[2 * gridsize + 1] += score;
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }

    return false;
  }
}
