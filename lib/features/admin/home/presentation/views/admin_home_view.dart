import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/get_teams_cubit/get_teams_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_home_view_body.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetTeamsCubit(locator<AdminHomeRepo>()),
        child: const AdminHomeViewBody(),
      ),
    );
  }
}
