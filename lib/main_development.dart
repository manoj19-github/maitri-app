import 'package:api_repository/api_repository.dart';
import 'package:maitri_app/app/app.dart';
import 'package:maitri_app/bootstrap.dart';
import 'package:maitri_app/firebase_options_dev.dart';
import 'package:powersync_repository/powersync_repository.dart';

void main() {
  final apiRepository = ApiRepository();
  bootstrap((PowerSyncRepository powersyncRepository) {
    return App(
      apiRepository: apiRepository,
    );
  }, firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}

