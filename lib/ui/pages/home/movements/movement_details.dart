import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovo/models/movement.dart';
import 'package:ovo/core/theme/elements/colors.dart';
import 'package:ovo/ui/pages/home/movements/detail.dart';

class MovementDetails extends StatelessWidget {
  final Movement movement;
  const MovementDetails({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: theme.extension<BrandColors>()!.tertiary,
                    shape: BoxShape.circle
                  ),
                  child: Icon(movement.type.icon, size: 30,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  movement.person,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              MovementDetail(label: 'Tipo', data: movement.type.code == 0 ? 'Trasferimento' : 'Pagamento con carta'),
              MovementDetail(
                  label: 'Importo',
                  data: '${movement.amount.toString()} ${movement.currency}'),
              MovementDetail(
                label: 'Data',
                data: DateFormat('dd MM yyyy - mm:kk').format(movement.date),
              )
            ],
          ),
        ),
      ),
    );
  }
}
