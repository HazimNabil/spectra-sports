import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

class RoleDropDownButton extends StatefulWidget {
  const RoleDropDownButton({super.key});

  @override
  State<RoleDropDownButton> createState() => _RoleDropDownButtonState();
}

class _RoleDropDownButtonState extends State<RoleDropDownButton> {
  String selectedRole = 'admin';
  final roles = const ['admin', 'coach', 'parent'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedRole,
      items: List.generate(3, dropDownItemGenerator),
      isExpanded: true,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      focusColor: AppColors.background,
      dropdownColor: AppColors.background,
      onChanged: (role) => setState(() => selectedRole = role!),
    );
  }

  DropdownMenuItem<String> dropDownItemGenerator(int index) {
    return DropdownMenuItem(
      value: roles[index],
      child: Text(roles[index]),
    );
  }
}
