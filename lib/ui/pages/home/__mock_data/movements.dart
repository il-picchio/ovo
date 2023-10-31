import 'package:ovo/models/amount.dart';
import 'package:ovo/models/movement.dart';
import 'package:ovo/models/movement_type.dart';

final movements = [
  Movement(
      type: MovementType.moneyTransfer,
      amount: Amount(value: -200.34),
      date: DateTime(2023, 9, 21),
      person: 'Montezuma S.R.L.',
      currency: 'CHF'),
  Movement(
      type: MovementType.moneyTransfer,
      amount: Amount(value: 1200),
      date: DateTime(2023, 9, 21),
      person: 'Mizuumi Corp',
      currency: 'CHF'),
  Movement(
      type: MovementType.cardPayment,
      amount: Amount(value: -20.12),
      date: DateTime(2023, 9, 20),
      person: 'Sushi',
      currency: 'CHF'),
  Movement(
      type: MovementType.cardPayment,
      amount: Amount(value: -2),
      date: DateTime(2023, 9, 20),
      person: 'Autogommista Lavena Ponte Tresa',
      currency: 'CHF'),
  Movement(
      type: MovementType.moneyTransfer,
      amount: Amount(value: 90.50),
      date: DateTime(2023, 9, 20),
      person: 'Billy',
      currency: 'CHF'),
  Movement(
      type: MovementType.cardPayment,
      amount: Amount(value: -2),
      date: DateTime(2023, 9, 20),
      person: 'Autogommista Lavena Ponte Tresa',
      currency: 'CHF'),
  Movement(
      type: MovementType.moneyTransfer,
      amount: Amount(value: -90.50),
      date: DateTime(2023, 9, 20),
      person: 'Billy',
      currency: 'CHF'),
  Movement(
      type: MovementType.moneyTransfer,
      amount: Amount(value: -90.50),
      date: DateTime(2023, 9, 20),
      person: 'Billy',
      currency: 'CHF'),
];
