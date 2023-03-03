import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';
import 'package:flutter_for_beginners_workshop/presentation/widgets/transaction_form.dart';
import 'package:flutter_for_beginners_workshop/presentation/widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.title, super.key});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> transactions = Transaction.dummyTransactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TransactionList(
        transactions: transactions,
        onRefresh: _onRefresh,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTransactionForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _onRefresh() async {
    setState(() {
      transactions = [];
    });

    await Future.delayed(
      const Duration(seconds: 1),
      () => setState(() {
        transactions = Transaction.dummyTransactions;
      }),
    );
  }

  Future<void> _showTransactionForm(BuildContext context) async {
    final transaction = await showModalBottomSheet<Transaction>(
      context: context,
      builder: (_) => TransactionForm(),
    );

    if (transaction != null) {
      setState(() {
        transactions = [transaction, ...transactions];
      });
    }
  }
}
