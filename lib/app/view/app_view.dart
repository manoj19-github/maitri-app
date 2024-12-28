import 'package:api_repository/api_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:maitri_app/counter/counter.dart';
import 'package:maitri_app/l10n/l10n.dart';
import 'package:maitri_app/login/login.dart';
import 'package:path_provider/path_provider.dart';

class AppView extends StatelessWidget {
  final ApiRepository apiRepository;
  AppView({super.key, required this.apiRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
      ],
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, mode) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          home: LoginView(),
        ),
      ),
    );
  }
}
