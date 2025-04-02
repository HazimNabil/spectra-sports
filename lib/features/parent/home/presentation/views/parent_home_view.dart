import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';
import 'package:spectra_sports/features/parent/widgets/parent_attendance_list_view.dart';
import 'package:spectra_sports/features/parent/widgets/parent_matches_section.dart';

class ParentHomeView extends StatelessWidget {
  const ParentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
    child:   Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Player Name" ) ,// change player name 
          SizedBox(height: 16,),
          CustomTabBar(tabs: ['Match','Attendance','Payment']),
          SizedBox(height: 16,),
           Expanded(
              child: TabBarView(
                children: [
                  ParentMatchesSection(),
                  ParentAttendanceListVew(),
                  
                  
                ],
              ),
            ),
        ],
      )
    ));
  }
}
