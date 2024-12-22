import 'package:flutter/widgets.dart';
import 'package:maitri_app/l10n/arb/app_localizations.dart';



extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
