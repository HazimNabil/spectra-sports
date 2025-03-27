import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;

  const CustomTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs.map((text) => Tab(text: text)).toList(),
      indicatorColor: AppColors.highlight,
      labelColor: AppColors.text,
      unselectedLabelColor: AppColors.hint,
      dividerHeight: 0,
      indicatorWeight: 0.5,
    );
  }
}
