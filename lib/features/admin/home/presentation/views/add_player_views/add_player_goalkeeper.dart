import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/goalkeeper_specs_section.dart';

class AddPlayerGoalkeeper extends StatefulWidget {
  final void Function() onNext;
  const AddPlayerGoalkeeper({required this.onNext, super.key});

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
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: "Next",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onNext();
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  color: AppColors.highlight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
