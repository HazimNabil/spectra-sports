import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_coach_details.dart';

class AddCoachView extends StatefulWidget {
  const AddCoachView({super.key});

  @override
  State<AddCoachView> createState() => _AddCoachViewState();
}

class _AddCoachViewState extends State<AddCoachView> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: const AddCoachDetails(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: "Apply",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  color: AppColors.highlight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
