import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/players_cubit/players_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_1.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_2.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_3.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_goalkeeper.dart';

class AdminAddPlayerView extends StatefulWidget {
  final String teamName;
  final String coachName;
  final PlayersCubit playersCubit;

  const AdminAddPlayerView({
    super.key,
    required this.teamName,
    required this.coachName,
    required this.playersCubit,
  });

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
      body: Provider(
        create: (context) => AddPlayerInput(
          teamName: widget.teamName,
          coachName: widget.coachName,
        ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
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
            AddPlayer2(
              onNext: () {
                int pageNumber = 2;

                _controller.animateToPage(
                  pageNumber,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              playersCubit: widget.playersCubit,
            ),
            AddPlayerGoalkeeper(onNext: () {
              int pageNumber = 3;

              _controller.animateToPage(
                pageNumber,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }, playersCubit: widget.playersCubit),
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
      ),
    );
  }
}
