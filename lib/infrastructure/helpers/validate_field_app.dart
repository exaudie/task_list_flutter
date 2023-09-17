import 'localize_app.dart';

class ValidateFieldApp {
  static String? validateRequired(String? value) =>
      (value == null || value.isEmpty) ? LocalizeApp.texts.errorRequired : null;

  static String? validatePrefixCode(String? value) {
    String? required = validateRequired(value);
    if (required != null) return required;

    return null;
  }
}
