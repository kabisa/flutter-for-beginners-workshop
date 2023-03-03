import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/domain/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.transaction,
    super.key,
  });

  final Transaction transaction;

  String _relativeDate(Transaction transaction) {
    int daysAgo = DateTime.now().difference(transaction.createdAt).inDays;
    return daysAgo == 0 ? "Today" : "$daysAgo days ago";
  }

  static const avatarBaseUrl = 'https://i.pravatar.cc/300?u=';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${transaction.kudos} ₭",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                        key: const ValueKey('sender-avatar'),
                        radius: 15,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                          "$avatarBaseUrl${transaction.fromName}",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                        key: const ValueKey('receiver-avatar'),
                        radius: 15,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                          "$avatarBaseUrl${transaction.toName}",
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _relativeDate(transaction),
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                transaction.toString(),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
