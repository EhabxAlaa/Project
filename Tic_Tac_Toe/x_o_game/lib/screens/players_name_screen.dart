import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tic_tac_toe_cubit.dart';

class PlayersNameScreen extends StatelessWidget {
  const PlayersNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeCubit, TicTacToeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TicTacToeCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Select players names'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: cubit.firstPlayerNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "First player name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: cubit.secondPlayerNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Second player name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 35, color: Colors.blue),
                    ),
                    onPressed: () {
                      cubit.goToGameScreen(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
