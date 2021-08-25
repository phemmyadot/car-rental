class ValidationService {
  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) return 'Email can\'t be empty';
    final regex = RegExp(
        '^[a-zA-Z0-9.!#\$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$');
    final isValid = regex.hasMatch(text);
    return isValid ? null : 'Email is not valid';
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) return 'Passowrd can\'t be empty';
    bool hasUppercase = text.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = text.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = text.contains(new RegExp(r'[a-z]'));

    if (!hasUppercase) return 'Password must contain at least one A-Z';
    if (!hasDigits) return 'Password must contain at least one 0-9';
    if (!hasLowercase) return 'Password must contain at least one a-z';
    if (text.length < 8) return 'Password must be at least 8 symbols';

    return null;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) return 'Name can\'t be empty';
    final regex = RegExp(r'^[a-z A-Z,.\-]+$');
    final isValid = regex.hasMatch(text);
    return isValid ? null : 'Full Name is not valid';
  }

  String? validatePhone(String? text) {
    return text == null || text.isEmpty ? 'Phone can\'t be empty' : null;
  }
}
