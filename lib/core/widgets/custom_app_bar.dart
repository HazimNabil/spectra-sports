import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/extensions.dart';
import 'package:spectra_sports/core/widgets/custom_back_button.dart';
import 'package:spectra_sports/core/widgets/logout_popup_menu.dart';

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
    return Container(
      width: double.infinity,
      height: 140 * context.heightScaleFactor,
      decoration: BoxDecoration(
        color: AppColors.text.withAlpha(230),
        image: const DecorationImage(
          image: AssetImage(AppImages.imagesStadiumLights),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Center(
        child: ListTile(
          leading: showBackButton ? const CustomBackButton() : null,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.styleExtraBold30(context),
          ),
          trailing: const LogoutPopupMenu(),
        ),
      ),
    );
  }
}
