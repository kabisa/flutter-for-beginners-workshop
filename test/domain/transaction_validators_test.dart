import 'package:flutter_for_beginners_workshop/domain/transaction_validators.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group(TransactionValidators, () {
    group(TransactionValidators.greaterThan, () {
      test(
          'returns an error message when the passed String value is not greater than the other value',
          () {
        expect(TransactionValidators.greaterThan(0)('0'), isA<String>());
      });

      test(
          'returns an error message when the passed String value can not be parsed to a number',
          () {
        expect(TransactionValidators.greaterThan(0)('a'), isA<String>());
      });

      test(
          'returns null when the passed String value is greater than the other value',
          () {
        expect(TransactionValidators.greaterThan(0)('1'), isNull);
      });
    });

    group(TransactionValidators.required, () {
      test('returns an error message when the passed value is null', () {
        expect(TransactionValidators.required(null), isA<String>());
      });

      test('returns an error message when the passed value is empty', () {
        expect(TransactionValidators.required(' '), isA<String>());
      });

      test('returns null when the passed value is not null and not empty', () {
        expect(TransactionValidators.required('hello'), isNull);
      });
    });
  });
}
