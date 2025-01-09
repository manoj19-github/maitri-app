import 'package:api_repository/api_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maitri_app/app/app.dart';
import 'package:maitri_app/bootstrap.dart';
import 'package:maitri_app/firebase_options_dev.dart';
import 'package:powersync_repository/powersync_repository.dart';
import 'package:shared/shared.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:token_storage/token_storage.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  final apiRepository = ApiRepository();
  bootstrap((PowerSyncRepository powersyncRepository) {
    final powerSyncRepos = PowerSyncRepository();
    final tokenStorage = InMemoryTokenStorage();
    final googleSignin = GoogleSignIn(
        clientId: Environment.GoogleSignInClientId,
        serverClientId: Environment.GoogleSignInClientSecret);

    final supabaseAuthClient = SupabaseAuthenticationClient(
        powerSyncRepository: powersyncRepository,
        tokenStorage: tokenStorage,
        googleSignIn: googleSignin);
    final userRepository =
        UserRepository(authenticationClient: supabaseAuthClient);
    return App(
      apiRepository: apiRepository,
      userRepository: userRepository,
    );
  }, firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}

