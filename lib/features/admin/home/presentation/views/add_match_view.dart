import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo_impl.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/add_match_cubit/add_match_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_view_body.dart';

class AddMatchView extends StatelessWidget {
  final String teamId;

  const AddMatchView({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddMatchCubit(locator<AdminHomeRepoImpl>()),
        child: AddMatchViewBody(teamId: teamId),
      ),
    );
  }
}
