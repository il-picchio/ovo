import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MovementType implements Comparable<MovementType> {
  moneyTransfer(code: 0, icon: FontAwesomeIcons.moneyBillTransfer),
  cardPayment(code: 1, icon: FontAwesomeIcons.creditCard);
  

  const MovementType({ required this.code, required this.icon });

  final int code;
  final IconData icon;

  @override
  int compareTo(MovementType other) => code - other.code;
}
