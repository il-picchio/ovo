import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/position.dart';

abstract class Decorations {
  static home(BuildContext context) {
    final Size(:width) = MediaQuery.of(context).size;
    return [
      Position(top: -50, left: -width / 3),
      Position(top: 300, right: -width / 1.5)
    ];
  }

  static cards(BuildContext context) {
    final Size(:width) = MediaQuery.of(context).size;
    return [
      Position(top: -50, right: -width / 1.3),
      Position(top: 400, left: -width / 3),
      Position(bottom: -100, right: -width / 1.6)
    ];
  }

  static payments(BuildContext context) {
    final Size(:width) = MediaQuery.of(context).size;
    return [
      Position(top: 100, left: -width / 3.5),
      Position(top: 400, right: -width / 1.6),
      Position(bottom: -50, left: -width / 1.5)
    ];
  }

  static investments(BuildContext context) {
    final Size(:width) = MediaQuery.of(context).size;
    return [
      Position(top: -150, left: width/1.8),
      Position(top: 300, right: width/2),
      Position(bottom: -70, right: -width / 1.6),
    ];
  }
}
