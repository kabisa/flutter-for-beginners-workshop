import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/solution/widgets/transaction_list.dart';
import 'package:flutter_for_beginners_workshop/presentation/solution/widgets/transaction_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../widget_tester_extension.dart';

class OnRefresh extends Mock {
  Future<void> call();
}

main() {
  group(TransactionList, () {
    testWidgets(
        'Given the refresh indicator'
        'When flinging down to refresh'
        'Then the onRefresh callback is called', (tester) async {
      final onRefresh = OnRefresh();

      when(onRefresh).thenAnswer(Future.value);

      await tester.pumpMaterialApp(
        TransactionList(
          transactions: Transaction.dummyTransactions,
          onRefresh: onRefresh,
        ),
      );

      await tester.fling(
        find.byType(TransactionCard).first,
        const Offset(0.0, 300.0),
        1000.0,
      );

      await tester.pumpAndSettle();

      verify(onRefresh).called(1);
    });

    testWidgets('shows the list of Transactions', (tester) async {
      await mockNetworkImages(
        () async => await tester.pumpMaterialApp(
          TransactionList(
            transactions: Transaction.dummyTransactions,
            onRefresh: () async {},
          ),
        ),
      );

      expect(
        find.byType(TransactionCard),
        findsNWidgets(Transaction.dummyTransactions.length),
      );
    });
  });
}
