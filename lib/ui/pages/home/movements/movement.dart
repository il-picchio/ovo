import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovo/models/movement.dart';
import 'package:ovo/ui/pages/home/movements/movement_details.dart';

class MovementContainer extends StatelessWidget {
  final Movement movement;
  const MovementContainer({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            clipBehavior: Clip.antiAlias,
            builder: (context) => MovementDetails(
                  movement: movement,
                ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.indigo.shade100),
              child: Icon(
                movement.type.icon,
                size: 20.0,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movement.person,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('dd MM yyyy - mm:kk').format(movement.date),
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: movement.amount.isPositive
                    ? Colors.green.shade200
                    : Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                '${movement.amount.toString()} ${movement.currency}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: movement.amount.isPositive
                        ? Colors.black87
                        : Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
