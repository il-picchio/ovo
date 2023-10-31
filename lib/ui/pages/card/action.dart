import 'package:flutter/material.dart';

class CreditCardAction extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const CreditCardAction({super.key, required this.icon, required this.text, this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 40,
            ),
          ]),
      child: Material(
        child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Icon(icon, color: color,),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
