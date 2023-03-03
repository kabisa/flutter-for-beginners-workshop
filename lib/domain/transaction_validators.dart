class TransactionValidators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  static String? Function(String?) greaterThan(int greaterThan) {
    return (value) {
      final numValue = int.tryParse(value ?? '');
      if (numValue == null || numValue <= greaterThan) {
        return 'Value should be greater than $greaterThan';
      }

      return null;
    };
  }
}
