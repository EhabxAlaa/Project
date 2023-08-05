import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

import '../models/game.dart';
import '../screens/players_name_screen.dart';

part 'tic_tac_toe_state.dart';

class TicTacToeCubit extends Cubit<TicTacToeStates> {
  TicTacToeCubit() : super(TicTacToeInitialState());

  static TicTacToeCubit get(context) => BlocProvider.of(context);

  bool isMulti = true;

  bool isFirstPlayerWins = false;
  TextEditingController firstPlayerNameController = TextEditingController();
  TextEditingController secondPlayerNameController = TextEditingController();

  String lastplayer = "X";
  bool gameover = false;
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  Game g = Game();
  int turn = 0;
  String res = "";

  setGameMode(bool isMultiplayer, context) {
    isMulti = isMultiplayer;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context2) => BlocProvider.value(
          value: BlocProvider.of<TicTacToeCubit>(context),
          child: const PlayersNameScreen(),
        ),
      ),
    );
    emit(SelectGameModeState());
  }

  goToGameScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context2) => BlocProvider.value(
          value: BlocProvider.of<TicTacToeCubit>(context),
          child: const GameScreen(),
        ),
      ),
    );
    emit(GoToGameScreenState());
  }
}
