import 'package:ovo/models/amount.dart';
import 'package:ovo/models/movement_type.dart';

class Movement {
  final MovementType type;
  final Amount amount;
  final DateTime date;
  final String person;
  final String currency;

  Movement(
      {required this.type,
      required this.amount,
      required this.date,
      required this.person,
      required this.currency});
}
