import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/features/auth/data/models/login_body_model.dart';

class RoleDropDownButton extends StatefulWidget {
  const RoleDropDownButton({super.key});

  @override
  State<RoleDropDownButton> createState() => _RoleDropDownButtonState();
}

class _RoleDropDownButtonState extends State<RoleDropDownButton> {
  final roles = const ['admin', 'coach', 'parent'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: context.read<LoginBodyModel>().role,
      items: List.generate(3, dropDownItemGenerator),
      isExpanded: true,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      focusColor: AppColors.background,
      dropdownColor: AppColors.background,
      onChanged: (role) {
        setState(() => context.read<LoginBodyModel>().role = role!);
      },
    );
  }

  DropdownMenuItem<String> dropDownItemGenerator(int index) {
    return DropdownMenuItem(
      value: roles[index],
      child: Text(roles[index]),
    );
  }
}
