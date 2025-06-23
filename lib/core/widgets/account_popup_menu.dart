import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';

class AccountPopupMenu extends StatelessWidget {
  const AccountPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go(AppRouter.loginRoute);
        }
      },
      child: PopupMenuButton(
        color: AppColors.background,
        iconColor: AppColors.background,
        position: PopupMenuPosition.under,
        menuPadding: EdgeInsets.zero,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Center(
              child: Text(
                'Logout',
                style: AppStyles.styleBold15(context),
              ),
            ),
            onTap: () => context.read<AuthCubit>().logout(),
          ),
        ],
      ),
    );
  }
}
