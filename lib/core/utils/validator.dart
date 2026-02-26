abstract class Validator {
  static String? requiredField(dynamic value, {String? message}) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return message ?? "هذا الحقل مطلوب";
    }
    return null;
  }
static String? numbersOnly(String? value, {String? message}) {
  final numericRegex = RegExp(r'^[0-9]+$');

  if (value != null && value.isNotEmpty && !numericRegex.hasMatch(value)) {
    return message ?? "يجب إدخال أرقام فقط";
  }

  return null;
}

}
