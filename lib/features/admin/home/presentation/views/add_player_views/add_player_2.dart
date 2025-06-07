import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/players_cubit/players_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section.dart';

class AddPlayer2 extends StatefulWidget {
  final void Function() onNext;

  const AddPlayer2({
    super.key,
    required this.onNext,
  });

  @override
  State<AddPlayer2> createState() => _AddPlayer2State();
}

class _AddPlayer2State extends State<AddPlayer2> {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const PlayerSpecsSection(),
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
                            final addPlayerInput = Provider.of<AddPlayerInput>(
                                context,
                                listen: false);
                            await context
                                .read<PlayersCubit>()
                                .addPlayer(addPlayerInput);
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
      ),
    );
  }
}
