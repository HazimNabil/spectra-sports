import 'package:flutter/material.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_1.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_2.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_3.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_goalkeeper.dart';

class AdminAddPlayerView extends StatefulWidget {
  const AdminAddPlayerView({super.key});

  @override
  State<AdminAddPlayerView> createState() => _AdminAddPlayerViewState();
}

class _AdminAddPlayerViewState extends State<AdminAddPlayerView> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          AddPlayer1(
            onNext: (bool isGoalKeeper) {
              int pageNumber = 1;
              if (isGoalKeeper) {
                pageNumber = 2;
              }
              _controller.animateToPage(
                pageNumber,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          AddPlayerGoalkeeper(onNext: () {
            int pageNumber = 3;

            _controller.animateToPage(
              pageNumber,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          AddPlayer2(onNext: () {
            int pageNumber = 3;

            _controller.animateToPage(
              pageNumber,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          AddPlayer3(onNext: () {
            int pageNumber = 0;

            _controller.animateToPage(
              pageNumber,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
        ],
      ),
    );
  }
}
