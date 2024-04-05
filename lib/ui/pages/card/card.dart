import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/card/action.dart';
import 'package:ovo/ui/pages/card/card_limits.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Ovo Debit Card'),
        centerTitle: true,
      ),
      body: Background(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decorations: Decorations.cards(context),
        child: Column(
          children: [
            CreditCardWidget(
              textStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
              cardNumber: '000 000 0000 0000 000',
              expiryDate: '10/26',
              cardHolderName: 'Test Name',
              cvvCode: '000',
              showBackView: false,
              cardType: CardType.mastercard,
              cardBgColor: Theme.of(context).colorScheme.secondary,
              onCreditCardWidgetChange: (brand) {},
            ),
            const Padding(
              padding: EdgeInsets.only(
                  right: 15.0, left: 15.0, top: 10.0, bottom: 20.0),
              child: CardLimit(limit: 10000, used: 7300),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CreditCardAction(
                  icon: FontAwesomeIcons.eye,
                  text: 'Show details',
                ),
                CreditCardAction(icon: FontAwesomeIcons.gear, text: 'Settings'),
                CreditCardAction(
                  icon: FontAwesomeIcons.snowflake,
                  text: 'Freeze',
                  color: Colors.blue.shade200,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
