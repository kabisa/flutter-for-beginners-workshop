import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/widgets/transaction_widget.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.transactions,
    required this.onRefresh,
    super.key,
  });

  final List<Transaction> transactions;
  final AsyncCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: transactions.length,
        itemBuilder: (context, index) => TransactionWidget(
          transaction: transactions[index],
        ),
        separatorBuilder: (context, _) => const SizedBox(height: 16),
      ),
    );
  }
}
