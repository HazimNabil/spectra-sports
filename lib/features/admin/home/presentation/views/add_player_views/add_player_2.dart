import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section.dart';

class AddPlayer2 extends StatefulWidget {
  final void Function() onNext;

  const AddPlayer2({required this.onNext, super.key});

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
      ),
    );
  }
}
