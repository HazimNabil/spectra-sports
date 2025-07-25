import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';
import 'package:spectra_sports/features/parent/home/data/repos/parent_home_repo_impl.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_attendance_section.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_matches_section.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_payment_section.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/parent_player_data.dart';
import 'package:spectra_sports/features/parent/home/presentation/view_models/payment/payment_cubit.dart';

class ParentHomeViewBody extends StatelessWidget {
  final ParentPlayerData playersData;

  const ParentHomeViewBody({super.key, required this.playersData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: playersData.player.shortName!,
          showBackButton: false,
        ),
        const SizedBox(
          height: 8,
        ),
        const CustomTabBar(
          tabs: ['Match', 'Attendance', 'Payment'],
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ParentMatchesSection(matches: playersData.matches!),
              ParentAttendanceSection(
                attendance: playersData.player.attendance!,
              ),
              BlocProvider(
                create: (context) => PaymentCubit(
                  locator<ParentHomeRepoImpl>(),
                ),
                child: const ParentPaymentSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
