class transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  transaction(
      {required this.id,
      required this.amount,
      required this.title,
      required this.date});
}
