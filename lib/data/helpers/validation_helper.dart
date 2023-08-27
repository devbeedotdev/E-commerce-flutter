import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/phone_number.dart';

class ValidationHelper {
  static String? isValidInput(String? data,
      {int? minLength = 1, int? maxLength}) {
    if (data == null) return 'Input is empty';
    data = data.trim();
    if (data.isEmpty) return 'Input is empty';
    if (data.length < (minLength == 5 ? 1 : minLength ?? 1)) {
      return 'Input is lesser than $minLength characters.';
    }
    if (maxLength != null) {
      if (data.length > maxLength) {
        return "Input must be at most $maxLength characters.";
      }
    }
    return null;
  }

  static String? isValidPhone(PhoneNumber data) {
    if (data.number.trim() == '') return 'Input is empty';
    return null;
  }

  static String? isValidNumber(String data, {int? minLength, int? maxLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9]+$');
    if (charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid number';
  }

  static String? isValidAmount(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9₦,.]+$');
    if (charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid amount';
  }

  static String? isValidString(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if (charRegExp.hasMatch(data)) return 'Input is not valid';
    return null;
  }

  static String? isValidEmail(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!charRegExp.hasMatch(data)) return 'Input is not a valid email';
    return null;
  }

  static String? isValidPassword(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: 8);
    if (result != null) return result;

    final RegExp charRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!charRegExp.hasMatch(data)) {
      return 'Password should contain at least : \nOne upper case\nOne lower case\nOne digit and one special character';
    }

    return null;
  }

  static String? isValidPhoneNumber(String data,
      {int minLength = 9, int maxLength = 10}) {
    data = data.trim();
    String? result = isValidInput(
      data,
      minLength: minLength,
    );
    if (data.length > maxLength) {
      return "Input must be at most $maxLength digits";
    }
    if (data.length < minLength) {
      return "Input must be at least $minLength digits";
    }
    if (result != null) return result;

    // ignore: unused_local_variable
    final RegExp charRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    // if(!charRegExp.hasMatch(data)) return 'Input is not a valid mobile number';
    return null;
  }

  static String convertAmount(String amount) {
    amount = amount.replaceAll(RegExp('[₦,.]'), '');
    return amount;
  }
}

class AmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _formatAsAmount(newValue.text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatAsAmount(String text) {
    // Remove any existing non-numeric characters
    text = text.replaceAll(RegExp('[^0-9.]'), '');

    // Get the index of the decimal point, if it exists
    int decimalIndex = text.indexOf('.');

    if (decimalIndex == -1) {
      // If there is no decimal point, format the whole number
      return _formatWholeNumber(text);
    } else {
      // If there is a decimal point, format both the whole number and the decimal part
      String wholeNumber = text.substring(0, decimalIndex);
      String decimalPart = text.substring(decimalIndex + 1);
      return "${_formatWholeNumber(wholeNumber)}.${_formatDecimalPart(decimalPart)}";
    }
  }

  static String formatAmountWithCommas(double amount) {
    // Create a NumberFormat instance with comma-separated format without decimal places
    final format = NumberFormat("#,##0", "en_US");

    // Format the number as an amount with commas without decimal places
    String formattedAmount = format.format(amount);

    return formattedAmount;
  }

  String _formatWholeNumber(String wholeNumber) {
    if (wholeNumber.isEmpty) {
      return '';
    }

    // Format the whole number with comma separators
    int length = wholeNumber.length;
    String formattedNumber = '';

    for (int i = 0; i < length; i++) {
      formattedNumber += wholeNumber[i];
      if (i < length - 1 && (length - 1 - i) % 3 == 0) {
        formattedNumber += ',';
      }
    }

    return formattedNumber;
  }

  String _formatDecimalPart(String decimalPart) {
    // Limit decimal part to 2 digits
    if (decimalPart.length > 2) {
      return decimalPart.substring(0, 2);
    }
    return decimalPart;
  }
}
