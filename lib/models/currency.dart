class Currency {
  static const chf = Currency._(id: 'CHF');
  static const eur = Currency._(id: 'EUR');
  static const usd = Currency._(id: 'USD');

  static const values = [Currency.chf, Currency.eur, Currency.usd];

  final String id;

  const Currency._({ required this.id });
}