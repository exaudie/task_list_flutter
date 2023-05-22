import 'localize_app.dart';

class ValidateFieldApp {
  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return LocalizeApp.texts.errorRequired;
    }

    return null;
  }

  static String? validatePrefixCode(String? value) {
    String? required = validateRequired(value);
    if (required != null) return required;

    return null;
  }
}
