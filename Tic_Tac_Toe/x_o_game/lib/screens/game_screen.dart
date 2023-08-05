import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tic_tac_toe_cubit.dart';
import '../models/game.dart';
import 'popup_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    var cubit = TicTacToeCubit.get(context);
    cubit.g.board = Game.initGameBoard();
  }

  @override
  Widget build(BuildContext context) {
    double boardwidth = MediaQuery.of(context).size.width;

    return BlocConsumer<TicTacToeCubit, TicTacToeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TicTacToeCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Tic Tac Toe'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${cubit.firstPlayerNameController.text} vs ${cubit.secondPlayerNameController.text}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "it is ${cubit.lastplayer} turn",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: boardwidth,
                      height: boardwidth,
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        //padding: const EdgeInsets.all(0),
                        crossAxisCount: 3,
                        children: List.generate(9, (index) {
                          return InkWell(
                            onTap: cubit.gameover
                                ? null
                                : () {
                                    if (cubit.g.board![index] == "") {
                                      setState(() {
                                        cubit.g.board![index] =
                                            cubit.lastplayer;
                                        cubit.turn++;
                                        cubit.gameover = cubit.g.winnercheck(
                                            cubit.lastplayer,
                                            index,
                                            cubit.scoreboard,
                                            3);
                                        if (cubit.gameover) {
                                          cubit.res =
                                              "${cubit.lastplayer} is The Winner!";
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return PopupScreen(
                                                winner: cubit.res,
                                                onReplay: () {
                                                  setState(() {
                                                    cubit.g.board =
                                                        Game.initGameBoard();
                                                    cubit.lastplayer = "X";
                                                    cubit.gameover = false;
                                                    cubit.turn = 0;
                                                    cubit.res = "";
                                                    cubit.scoreboard = [
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      0
                                                    ];
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              );
                                            },
                                          );
                                        } else if (!cubit.gameover &&
                                            cubit.turn == 9) {
                                          cubit.res = "Draw.. ";
                                          cubit.gameover = true;
                                        }
                                        if (cubit.lastplayer == "X") {
                                          cubit.lastplayer = "O";
                                        } else {
                                          cubit.lastplayer = "X";
                                        }
                                      });
                                    }
                                  },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: Text(
                                  cubit.g.board![index],
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: cubit.g.board![index] == "X"
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Text(
                      cubit.res,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              cubit.g.board = Game.initGameBoard();
                              cubit.lastplayer = "X";
                              cubit.gameover = false;
                              cubit.turn = 0;
                              cubit.res = "";
                              cubit.scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                            });
                          },
                          icon: const Icon(Icons.replay_rounded),
                          label: Center(
                            child: TextButton(
                              child: const Text(
                                "Repeat the game ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  cubit.g.board = Game.initGameBoard();
                                  cubit.lastplayer = "X";
                                  cubit.gameover = false;
                                  cubit.turn = 0;
                                  cubit.res = "";
                                  cubit.scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                                });
                              },
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
