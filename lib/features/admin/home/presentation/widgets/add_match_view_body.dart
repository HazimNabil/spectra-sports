import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_form.dart';

class AddMatchViewBody extends StatefulWidget {
  const AddMatchViewBody({super.key});

  @override
  State<AddMatchViewBody> createState() => _AddMatchViewBodyState();
}

class _AddMatchViewBodyState extends State<AddMatchViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
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
                  );
                },
              ),
              const SizedBox.expand(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: 'Add',
                  color: AppColors.highlight,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    } else {
                      _autovalidateMode.value = AutovalidateMode.always;
                    }
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
