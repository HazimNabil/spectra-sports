import 'package:flutter/material.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_1.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_2.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_player_views/add_player_3.dart';

class AdminAddPlayerView extends StatefulWidget {
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
          Addplayer1(
            onNext: (bool isGoalKeaper) {
              int pagenumber = 1;
              if (isGoalKeaper == true) {
                pagenumber = 2;
              }
              _controller.animateToPage(
                pagenumber,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          AddPlayer2(
            onNext: () {
              int pagenumber = 2;
              
              _controller.animateToPage(
                pagenumber,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
  }),
   AddPlayer3(
            onNext: () {
              int pagenumber = 0;
              
              _controller.animateToPage(
                pagenumber,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
  })
        ],
      ),
    );
  }
}
