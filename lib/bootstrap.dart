import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import "package:shared/shared.dart";
import "package:powersync_repository/powersync_repository.dart";

typedef AppBuilder = FutureOr<Widget> Function(PowerSyncRepository);

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logD('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logD('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(AppBuilder builder,
    {required FirebaseOptions firebaseOptions}) async {
  FlutterError.onError = (details) {
    logD(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      final powerSyncRepository = PowerSyncRepository();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: firebaseOptions);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
      await powerSyncRepository.initialize();
      await Firebase.initializeApp(options: firebaseOptions);
      // await DotEnv.dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((value) async => runApp(await builder(powerSyncRepository)));
    },
    (error, stackTrace) => logE(error.toString(), stackTrace: stackTrace),
  );
}
