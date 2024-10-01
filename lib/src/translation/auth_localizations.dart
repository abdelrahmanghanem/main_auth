import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A class responsible for loading and providing localized validation messages.
///
/// This class handles loading the appropriate JSON file for the current locale
/// and retrieving localized validation messages based on the locale.
///
/// - [locale]: The locale for which the localization is loaded.
class AuthLocalizations {
  final Locale locale;

  AuthLocalizations(this.locale);

  /// Retrieves the current [AuthLocalizations] instance from the given [BuildContext].
  ///
  /// This method allows widgets to access the current localization based on
  /// the context's locale.
  ///
  /// - [context]: The current [BuildContext] to retrieve the localization from.
  ///
  /// - Returns: The [AuthLocalizations] instance if found, or `null` if not available.
  static AuthLocalizations? of(BuildContext context) {
    return Localizations.of<AuthLocalizations>(
      context,
      AuthLocalizations,
    );
  }

  /// The delegate responsible for loading the localized validation messages.
  ///
  /// This delegate is required for integrating with Flutter's localization system.
  static const LocalizationsDelegate<AuthLocalizations> delegate =
      _AuthLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  /// Loads the localized strings for the current locale from a JSON file.
  ///
  /// The JSON file is expected to be located in the `translation` directory and
  /// named based on the locale's language code (e.g., `en.json` for English).
  ///
  /// - Returns: A [Future] that completes with `true` once the loading is finished.
  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'packages/main_auth/src/translation/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  /// Retrieves the localized string for the given [key].
  ///
  /// - [key]: The key corresponding to the desired validation message.
  ///
  /// - Returns: The localized string if found, or `null` if the key is not present.
  String? translate(String? key) {
    return _localizedStrings[key!];
  }
}

/// A delegate responsible for loading [AuthLocalizations] based on the device's locale.
///
/// This delegate helps manage multiple languages by loading the appropriate
/// localization files for each supported locale.
class _AuthLocalizationsDelegate
    extends LocalizationsDelegate<AuthLocalizations> {
  const _AuthLocalizationsDelegate();

  /// Checks whether the given [locale] is supported by the app.
  ///
  /// Currently, the supported languages are English ("en") and Arabic ("ar").
  ///
  /// - [locale]: The locale to check.
  ///
  /// - Returns: `true` if the locale is supported, otherwise `false`.
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  /// Loads the [AuthLocalizations] for the provided [locale].
  ///
  /// This method loads the corresponding localization file based on the locale
  /// and returns the [AuthLocalizations] instance with the localized messages.
  ///
  /// - [locale]: The locale for which the localizations should be loaded.
  ///
  /// - Returns: A [Future] that completes with the loaded [AuthLocalizations] instance.
  @override
  Future<AuthLocalizations> load(Locale locale) async {
    AuthLocalizations localizations = AuthLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  /// Determines whether the localizations should be reloaded when the delegate changes.
  ///
  /// This method is typically called when localization files are dynamically updated.
  ///
  /// - [old]: The old delegate to compare against.
  ///
  /// - Returns: `false`, indicating that reloading is not necessary.
  @override
  bool shouldReload(_AuthLocalizationsDelegate old) => false;
}

/// Represents a validation message, with support for localization.
///
/// - [key]: The key used to retrieve the localized message.
/// - [message]: The default message used if no localization is available for the key.
class AuthMessage {
  final String? key;
  String? message;

  AuthMessage({
    this.key,
    this.message,
  });

  /// Retrieves the localized message for the given key from the [BuildContext].
  ///
  /// If the key is found in the localized strings, it returns the corresponding
  /// message. If no localized message is found, the default [message] is returned.
  ///
  /// - [context]: The current [BuildContext] used for accessing localization.
  ///
  /// - Returns: The localized message if available, or the default message.
  String? localize(BuildContext context) {
    message = AuthLocalizations.of(context)?.translate(key) ?? message;
    return message;
  }
}
