import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/add_match_cubit/admin_matches_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_form.dart';
import 'package:toastification/toastification.dart';

class AddMatchBottomSheet extends StatefulWidget {
  final String teamId;
  const AddMatchBottomSheet({super.key, required this.teamId});

  @override
  State<AddMatchBottomSheet> createState() => _AddMatchBottomSheetState();
}

class _AddMatchBottomSheetState extends State<AddMatchBottomSheet> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final AddMatchInput _addMatchInput;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    _addMatchInput = AddMatchInput()..team1 = widget.teamId;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Add Match',
                style: AppStyles.styleBold20(
                  context,
                ).copyWith(color: AppColors.text),
              ),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: _autovalidateMode,
              builder: (_, value, __) {
                return AddMatchForm(
                  formKey: _formKey,
                  autovalidateMode: value,
                  addMatchInput: _addMatchInput,
                );
              },
            ),
            const SizedBox(height: 24),
            BlocConsumer<AdminMatchesCubit, AdminMatchesState>(
              listener: (context, state) {
                if (state is AdminMatchesSuccess) {
                  context.pop();
                } else if (state is AdminMatchesFailure) {
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
                    title: 'Add',
                    color: AppColors.highlight,
                    isLoading: state is AdminMatchesLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context
                            .read<AdminMatchesCubit>()
                            .addMatch(_addMatchInput);
                      } else {
                        _autovalidateMode.value = AutovalidateMode.always;
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
