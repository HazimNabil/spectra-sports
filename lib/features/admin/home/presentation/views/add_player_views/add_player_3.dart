import 'package:flutter/material.dart';

import 'package:spectra_sports/core/utils/app_colors.dart';

import 'package:spectra_sports/core/widgets/custom_button.dart';

import 'package:spectra_sports/features/admin/home/presentation/widgets/add_parent_details_form.dart';

class AddPlayer3 extends StatefulWidget {
  final void Function() onNext;

  const AddPlayer3({required this.onNext, super.key});

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
              child: CustomButton(
                title: "Apply",
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
          ),
        ],
      ),
    );
  }
}
