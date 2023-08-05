import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tic_tac_toe_cubit.dart';

class StartMenuScreen extends StatefulWidget {
  const StartMenuScreen({super.key});

  @override
  State<StartMenuScreen> createState() => StartMenuScreenState();
}

class StartMenuScreenState extends State<StartMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeCubit, TicTacToeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TicTacToeCubit.get(context);
        return Scaffold(
          //backgroundColor: Colors.black,
          appBar: AppBar(
            //backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                "Tic-Tac-Toe Game",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: TextButton(
                child: const Text(
                  "Multiplayer",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                onPressed: () {
                  cubit.setGameMode(true, context);
                },
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  "Single player",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                onPressed: () {
                  cubit.setGameMode(false, context);
                },
              ),
            ),
          ]),
        );
      },
    );
  }
}
