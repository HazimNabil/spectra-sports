import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo_impl.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/members_cubit/members_cubit.dart';
import 'package:spectra_sports/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spectra_sports/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';

import 'core/routes/app_router.dart';

class SpectraSports extends StatelessWidget {
  const SpectraSports({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(locator<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => MembersCubit(locator<AdminHomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Spectra Sports',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
