import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_parent_body.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_parent_details_form.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/register_parent_cubit/register_parent_cubit.dart';
import 'package:toastification/toastification.dart';

class AddPlayer3 extends StatefulWidget {
  const AddPlayer3({super.key});

  @override
  State<AddPlayer3> createState() => _AddPlayer3State();
}

class _AddPlayer3State extends State<AddPlayer3> {
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
      child: Column(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: const AddParentDetails(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: BlocConsumer<RegisterParentCubit, RegisterParentState>(
                listener: (context, state) {
                  if (state is RegisterParentSuccess) {
                    context.pop();
                  } else if (state is RegisterParentFailure) {
                    showToast(
                      context: context,
                      title: state.message,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    title: "Finish",
                    isLoading: state is RegisterParentLoading,
                    color: AppColors.highlight,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final playerName =
                            context.read<AddPlayerInput>().shortName;
                        final parent = context.read<RegisterParentBody>();
                        parent.players = [playerName!];
                        context
                            .read<RegisterParentCubit>()
                            .registerParent(parent);
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
