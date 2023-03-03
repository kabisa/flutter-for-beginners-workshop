import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/widgets/transaction_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widget_tester_extension.dart';

main() {
  group(TransactionWidget, () {
    final transaction = Transaction.dummyTransactions.first;

    Future<void> pumpTransactionWidget(WidgetTester tester) async {
      return await tester.pumpMaterialApp(
        TransactionWidget(transaction: transaction),
      );
    }

    testWidgets('shows an image for the sender', (tester) async {
      await pumpTransactionWidget(tester);

      final avatar = find.byKey(const ValueKey('sender-avatar'));

      expect(
        (tester.firstWidget(avatar) as CircleAvatar).backgroundImage,
        NetworkImage(
            '${TransactionWidget.avatarBaseUrl}${transaction.fromName}'),
      );
    });

    testWidgets('shows an image for the receiver', (tester) async {
      await pumpTransactionWidget(tester);

      final avatar = find.byKey(const ValueKey('receiver-avatar'));

      expect(
        (tester.firstWidget(avatar) as CircleAvatar).backgroundImage,
        NetworkImage('${TransactionWidget.avatarBaseUrl}${transaction.toName}'),
      );
    });

    testWidgets('shows the transaction text', (tester) async {
      await pumpTransactionWidget(tester);

      expect(find.text(transaction.toString()), findsOneWidget);
    });
  });
}
