import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/extensions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/academy_info_form.dart';

class AcademyInfoViewBody extends StatefulWidget {
  const AcademyInfoViewBody({super.key});

  @override
  State<AcademyInfoViewBody> createState() => _AcademyInfoViewBodyState();
}

class _AcademyInfoViewBodyState extends State<AcademyInfoViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    _autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: context.height * 0.87),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Academy Information',
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.text),
            ),
            ValueListenableBuilder(
              valueListenable: _autovalidateMode,
              builder: (_, value, __) {
                return AcademyInfoForm(
                  formKey: _formKey,
                  autovalidateMode: value,
                );
              },
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: CustomButton(
                title: 'Save',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    _autovalidateMode.value = AutovalidateMode.always;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
