import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/players_cubit/players_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/goalkeeper_specs_section.dart';

class AddPlayerGoalkeeper extends StatefulWidget {
  final void Function() onNext;
  final PlayersCubit playersCubit;

  const AddPlayerGoalkeeper({
    required this.onNext,
    super.key,
    required this.playersCubit,
  });

  @override
  State<AddPlayerGoalkeeper> createState() => _AddPlayerGoalkeeperState();
}

class _AddPlayerGoalkeeperState extends State<AddPlayerGoalkeeper> {
  late final GlobalKey<FormState> _formKey;
  late final AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          children: [
            const GoalkeeperSpecsSection(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<PlayersCubit, PlayersState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: "Add",
                      isLoading: state is PlayersLoading,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final addPlayerInput = context.read<AddPlayerInput>();
                          await widget.playersCubit.addPlayer(addPlayerInput);
                          if (context.mounted) context.pop();
                        } else {
                          setState(() {
                            _autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      color: AppColors.highlight,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
