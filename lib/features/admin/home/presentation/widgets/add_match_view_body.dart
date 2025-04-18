import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/extensions.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/add_match_cubit/add_match_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_form.dart';
import 'package:toastification/toastification.dart';

class AddMatchViewBody extends StatefulWidget {
  final String teamId;

  const AddMatchViewBody({super.key, required this.teamId});

  @override
  State<AddMatchViewBody> createState() => _AddMatchViewBodyState();
}

class _AddMatchViewBodyState extends State<AddMatchViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final AddMatchInput _addMatchInput;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    _addMatchInput = AddMatchInput();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add Match',
                  style: AppStyles.styleExtraBold24(context),
                ),
              ),
              const SizedBox(height: 48),
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
              SizedBox(height: context.height * 0.2),
              BlocConsumer<AddMatchCubit, AddMatchState>(
                listener: (context, state) {
                  if (state is AddMatchSuccess) {
                    context.pop();
                  } else if (state is AddMatchFailure) {
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
                      isLoading: state is AddMatchLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read<AddMatchCubit>()
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
      ),
    );
  }
}
