class Transaction {
  final int kudos;
  final String fromName;
  final String toName;
  final String note;
  final DateTime createdAt;

  const Transaction({
    required this.kudos,
    required this.fromName,
    required this.toName,
    required this.note,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          kudos == other.kudos &&
          fromName == other.fromName &&
          toName == other.toName &&
          note == other.note &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      kudos.hashCode ^
      fromName.hashCode ^
      toName.hashCode ^
      note.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return '$fromName gave $kudos₭ to $toName for $note';
  }

  static final List<Transaction> dummyTransactions = [
    Transaction(
      fromName: "Emmerson Jules",
      toName: "Chris Campbell",
      createdAt: DateTime.parse("2023-01-31T12:13:48.90337+0200"),
      kudos: 10,
      note: "being even better than a unicorn, because you're real.",
    ),
    Transaction(
      fromName: "Kerry Kelcey",
      toName: "Leighton Dezi",
      createdAt: DateTime.parse("2023-01-31T15:22:47.209402+0200"),
      kudos: 20,
      note: "you always know just what to say.",
    ),
    Transaction(
      fromName: "Martie Esme",
      toName: "Vivian Casey",
      createdAt: DateTime.parse(
        "2023-01-02T09:56:52.285789+0200",
      ),
      kudos: 10,
      note:
          "that thing you don’t like about yourself is what makes you so interesting.",
    ),
    Transaction(
      fromName: "Jamey Gayle",
      toName: "Grier London",
      createdAt: DateTime.parse("2023-01-02 14:37:40.669265+0200"),
      kudos: 25,
      note: "bringing out the best in other people.",
    ),
    Transaction(
      fromName: "Kamryn Quin",
      toName: "Neely Florence",
      createdAt: DateTime.parse("2023-01-03T15:40:49.937988+0200"),
      kudos: 25,
      note: "being like sunshine on a rainy day.",
    ),
  ];
}
