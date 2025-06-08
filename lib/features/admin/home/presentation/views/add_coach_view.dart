import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_coach_body.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/members_cubit/members_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_coach_details.dart';
import 'package:toastification/toastification.dart';

class AddCoachView extends StatefulWidget {
  final String teamName;
  const AddCoachView({super.key, required this.teamName});

  @override
  State<AddCoachView> createState() => _AddCoachViewState();
}

class _AddCoachViewState extends State<AddCoachView> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final RegisterCoachBody _registerCoachBody;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    _registerCoachBody = RegisterCoachBody()..teamId = widget.teamName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _autovalidateMode,
              builder: (_, value, __) {
                return Form(
                  key: _formKey,
                  autovalidateMode: value,
                  child: AddCoachDetails(registerCoachBody: _registerCoachBody),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: BlocConsumer<MembersCubit, MembersState>(
                  listener: (context, state) {
                    if (state is MembersSuccess) {
                      context.pop();
                    } else if (state is MembersFailure) {
                      showToast(
                        context: context,
                        title: state.message,
                        type: ToastificationType.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      title: "Apply",
                      color: AppColors.highlight,
                      isLoading: state is MembersLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read<MembersCubit>()
                              .registerCoach(_registerCoachBody);
                        } else {
                          _autovalidateMode.value = AutovalidateMode.always;
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
