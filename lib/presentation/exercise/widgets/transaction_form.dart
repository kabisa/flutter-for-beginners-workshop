import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction_validators.dart';
import 'package:flutter_for_beginners_workshop/presentation/exercise/home_screen.dart';

/// 3️⃣ Exercise 3: Transaction Form
///
/// 🙋🏽‍ As a user I want to send Kudo's to someone, to let them know my appreciation
///
/// Part 1: Show the transaction form as an overlay on the first screen
///
/// 🔦 Go to [HomeScreen] and show this widget in a bottom sheet using [showModalBottomSheet]
/// when a [FloatingActionButton] is tapped.
///
///
/// Part 2: Create the transaction form
///
/// 🔦 You can use the following widgets (hover in your IDE to get more info):
/// [Form], [TextFormField], [InputDecoration]
///
/// ⚠️ Make sure that we can only submit the form when the form input is valid
/// Use the [TransactionValidators] for this.
class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
