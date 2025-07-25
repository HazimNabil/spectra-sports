import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/extensions.dart';
import 'package:spectra_sports/core/widgets/custom_back_button.dart';
import 'package:spectra_sports/core/widgets/account_popup_menu.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 80 * context.heightScaleFactor,
        color: AppColors.text,
        child: showBackButton
            ? Center(
                child: ListTile(
                  leading: const CustomBackButton(),
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleExtraBold30(context),
                  ),
                  trailing: const AccountPopupMenu(),
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleExtraBold30(context),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: AccountPopupMenu(),
                  ),
                ],
              ),
      ),
    );
  }
}
