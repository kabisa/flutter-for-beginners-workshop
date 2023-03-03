import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/home_screen.dart';
import 'package:flutter_for_beginners_workshop/presentation/widgets/transaction_form.dart';
import 'package:flutter_for_beginners_workshop/presentation/widgets/transaction_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../widget_tester_extension.dart';

class FakeTransactionRoute extends Fake implements Route<Transaction> {}

void main() {
  group(HomeScreen, () {
    Future<void> renderHomeScreen(
      WidgetTester tester, [
      MockNavigator? navigator,
    ]) async {
      await tester.pumpMaterialApp(const HomeScreen(title: 'Home'), navigator);
    }

    setUpAll(() {
      registerFallbackValue(FakeTransactionRoute());
    });

    testWidgets('shows a title in the AppBar', (tester) async {
      await renderHomeScreen(tester);

      expect(find.widgetWithText(AppBar, 'Home'), findsOneWidget);
    });

    group(TransactionList, () {
      testWidgets('shows a TransactionList with default transactions',
          (tester) async {
        await renderHomeScreen(tester);

        final transactionList = find.byType(TransactionList);

        expect(transactionList, findsOneWidget);
        expect(
          (tester.firstWidget(transactionList) as TransactionList).transactions,
          Transaction.dummyTransactions,
        );
      });
    });

    group('Given the FloatingActionButton', () {
      final floatingActionButton = find.byType(FloatingActionButton);

      testWidgets('shows a FloatingActionButton with the correct icon',
          (tester) async {
        await renderHomeScreen(tester);

        expect(
          find.descendant(
            of: floatingActionButton,
            matching: find.byIcon(Icons.add),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'When the button is tapped '
          'Then it calls Navigator.push with ModalBottomSheetRoute<Transaction>',
          (tester) async {
        final navigator = MockNavigator();
        when(() => navigator.push<Transaction>(any())).thenAnswer(
          (_) => Future.value(
            Transaction.dummyTransactions.first,
          ),
        );

        await renderHomeScreen(tester, navigator);

        await tester.tap(floatingActionButton);

        verify(
          () => navigator.push<Transaction>(any(
            that: isA<ModalBottomSheetRoute<Transaction>>(),
          )),
        ).called(1);
      });
    });
  });
}
