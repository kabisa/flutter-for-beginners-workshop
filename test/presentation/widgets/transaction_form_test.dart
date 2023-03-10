import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/solution/widgets/transaction_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../widget_tester_extension.dart';

main() {
  group(TransactionForm, () {
    Future<void> renderTransactionForm(WidgetTester tester,
        [MockNavigator? navigator]) async {
      await tester.pumpMaterialApp(TransactionForm(), navigator);
    }

    final kudosTextFormField = find.byKey(const ValueKey('kudos-text-field'));
    final receiversTextFormField = find.byKey(
      const ValueKey('receivers-text-field'),
    );
    final messageTextFormField = find.byKey(
      const ValueKey('message-text-field'),
    );

    group('Given the TextFormField for kudos', () {
      testWidgets(
          'When typing a numeric value'
          'Then the input is shown in the field', (tester) async {
        await renderTransactionForm(tester);

        await tester.enterText(kudosTextFormField, '42');

        expect(
          find.descendant(of: kudosTextFormField, matching: find.text('42')),
          findsOneWidget,
        );
      });

      testWidgets(
          'When typing a non-numeric value'
          'Then the input is not shown in the field', (tester) async {
        await renderTransactionForm(tester);

        await tester.enterText(kudosTextFormField, 'abc');

        expect(
          find.descendant(of: kudosTextFormField, matching: find.text('abc')),
          findsNothing,
        );
      });

      testWidgets(
          'Given there is no input'
          'When tapping the submit button'
          'Then a validation error is shown', (tester) async {
        await renderTransactionForm(tester);

        await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
        await tester.pumpAndSettle();

        expect(find.text('Value should be greater than 0'), findsOneWidget);
      });

      testWidgets(
          'Given the input is 0'
          'When tapping the submit button'
          'Then a validation error is shown', (tester) async {
        await renderTransactionForm(tester);

        await tester.enterText(kudosTextFormField, '0');

        await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: kudosTextFormField,
            matching: find.text('Value should be greater than 0'),
          ),
          findsOneWidget,
        );
      });
    });

    group('Given the TextFormField for receivers', () {
      testWidgets(
          'Given the input is empty'
          'When tapping the submit button'
          'Then a validation error is shown', (tester) async {
        await renderTransactionForm(tester);

        await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: receiversTextFormField,
            matching: find.text('This field is required'),
          ),
          findsOneWidget,
        );
      });
    });

    group('Given the TextFormField for the message', () {
      testWidgets(
          'Given the input is empty'
          'When tapping the submit button'
          'Then a validation error is shown', (tester) async {
        await renderTransactionForm(tester);

        await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: messageTextFormField,
            matching: find.text('This field is required'),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        'Given the form has valid input '
        'When the submit button is tapped '
        'Then Navigator.pop is called with a Transaction', (tester) async {
      const kudos = '42';
      const receivers = 'Kabisa';
      const message = 'Organizing this workshop';
      final navigator = MockNavigator();

      await renderTransactionForm(tester, navigator);

      await tester.enterText(kudosTextFormField, kudos);
      await tester.enterText(receiversTextFormField, receivers);
      await tester.enterText(messageTextFormField, message);
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Submit'));

      verify(
        () => navigator.pop<Transaction>(
          any(that: predicate((Transaction transaction) {
            expect(transaction.kudos, int.parse(kudos));
            expect(transaction.toName, receivers);
            expect(transaction.note, message);

            return true;
          })),
        ),
      ).called(1);
    });
  });
}
