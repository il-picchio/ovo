import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/payments/action.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      decorations: Decorations.payments(context),
      alignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            elevation: 20,
            child: Column(
              children: [
                PaymentAction(
                  icon: FontAwesomeIcons.moneyBillTransfer,
                  text: 'Bonifico',
                  onTap: () {},
                ),
                Divider(
                  color: Colors.indigo.shade100.withOpacity(0.5),
                  indent: 40,
                  endIndent: 40,
                  height: 0.2,
                ),
                PaymentAction(
                  icon: FontAwesomeIcons.qrcode,
                  text: 'QR',
                  onTap: () {},
                ),
                PaymentAction(
                    icon: FontAwesomeIcons.fileInvoice,
                    text: 'EBill',
                    onTap: () {})
              ],
            ),
          ),
        )
      ],
    );
  }
}
