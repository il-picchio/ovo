import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/widgets/list_element_tile.dart';

class PaymentAction extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;

  const PaymentAction(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListElementTile(
      onTap: () {},
      icon: icon,
      main: Text(text),
      right: Icon(FontAwesomeIcons.circleArrowRight),
    );
  }
}
