import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/presentation/exercise/widgets/transaction_card.dart';

/// 4️⃣ Exercise 4: Saving new transactions (in memory)
///
/// 🙋🏽‍ As a user, I want to save new transactions, so I can give kudos to others
///
/// 👩‍💻 By now, your home screen should already have the ability to show a list of
/// kudo transactions and a way to open the transaction form. Now it is time to
/// save your newly created transactions in memory.
///
/// 🔦 Refactor your widget from a [StatelessWidget] to a [StatefulWidget]. It is
/// time to start working with local state!
///
/// ❓We haven't discussed navigation yet. To return data from the [showModalBottomSheet]
/// callback add the following to the callback where you want to submit your form:
/// ```dart
/// Navigator.of(context).pop(/*return your transaction here*/);
/// ```
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    // 💡 Use this transaction and pass this down to your TransactionCard to see your widget in action
    // ```final transaction = Transaction.dummyTransactions.first```;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const [TransactionCard()],
      ),
    );
  }
}
