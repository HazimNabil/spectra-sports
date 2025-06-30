import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/members_cubit/members_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section.dart';
import 'package:toastification/toastification.dart';

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
                child: BlocConsumer<MembersCubit, MembersState>(
                  listener: (context, state) {
                    if (state is MembersSuccess) {
                      widget.onNext();
                    } else if (state is MembersFailure) {
                      showToast(
                        context: context,
                        title: state.message,
                        type: ToastificationType.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        title: "Next",
                        isLoading: state is MembersLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final addPlayerInput = Provider.of<AddPlayerInput>(
                                context,
                                listen: false);
                            await context
                                .read<MembersCubit>()
                                .addPlayer(addPlayerInput);
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
