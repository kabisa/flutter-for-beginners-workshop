import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/solution/widgets/transaction_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widget_tester_extension.dart';

main() {
  group(TransactionCard, () {
    final transaction = Transaction.dummyTransactions.first;

    Future<void> pumpTransactionWidget(WidgetTester tester) async {
      return await tester.pumpMaterialApp(
        TransactionCard(transaction: transaction),
      );
    }

    testWidgets('shows an image for the sender', (tester) async {
      await pumpTransactionWidget(tester);

      final avatar = find.byKey(const ValueKey('sender-avatar'));

      expect(
        (tester.firstWidget(avatar) as CircleAvatar).backgroundImage,
        NetworkImage('${TransactionCard.avatarBaseUrl}${transaction.fromName}'),
      );
    });

    testWidgets('shows an image for the receiver', (tester) async {
      await pumpTransactionWidget(tester);

      final avatar = find.byKey(const ValueKey('receiver-avatar'));

      expect(
        (tester.firstWidget(avatar) as CircleAvatar).backgroundImage,
        NetworkImage('${TransactionCard.avatarBaseUrl}${transaction.toName}'),
      );
    });

    testWidgets('shows the transaction text', (tester) async {
      await pumpTransactionWidget(tester);

      expect(find.text(transaction.toString()), findsOneWidget);
    });
  });
}
