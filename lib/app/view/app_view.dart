import "package:app_ui/app_ui.dart";
import 'package:api_repository/api_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:maitri_app/auth/cubit/authtype_cubit.dart';
import 'package:maitri_app/auth/cubit/login_cubit.dart';
import 'package:maitri_app/auth/cubit/login_cubit.dart';
import 'package:maitri_app/auth/cubit/signup_cubit.dart';
import 'package:maitri_app/auth/view/auth_view.dart';
import 'package:maitri_app/auth/view/login_page.dart';
import 'package:maitri_app/counter/counter.dart';
import 'package:maitri_app/l10n/l10n.dart';
import 'package:maitri_app/login/login.dart';
import 'package:maitri_app/theme/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';


class AppView extends StatelessWidget {
  final ApiRepository apiRepository;
  final UserRepository userRepository;
  AppView(
      {super.key, required this.apiRepository, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        BlocProvider<AuthtypeCubit>(create: (_) => AuthtypeCubit()),
        BlocProvider<LoginCubit>(
            create: (_) => LoginCubit(userRepository: userRepository)),
        BlocProvider<SignupCubit>(
            create: (_) => SignupCubit(userRepository: userRepository)),
        
        
      ],
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, mode) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: const AppTheme().theme,
          themeMode: ThemeMode.system,
          darkTheme: const AppDarkTheme().theme,
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          home: AuthView(),
        ),
      ),
    );
  }
}
