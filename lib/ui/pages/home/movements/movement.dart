import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovo/models/movement.dart';
import 'package:ovo/ui/common/widgets/list_element_tile.dart';
import 'package:ovo/ui/pages/home/movements/movement_details.dart';

class MovementContainer extends StatelessWidget {
  final Movement movement;
  const MovementContainer({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    return ListElementTile(
      onTap: () {
        showModalBottomSheet(
            context: context,
            clipBehavior: Clip.antiAlias,
            builder: (context) => MovementDetails(
                  movement: movement,
                ));
      },
      icon: movement.type.icon,
      main: Column(
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
      right: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
              color:
                  movement.amount.isPositive ? Colors.black87 : Colors.white),
        ),
      ),
    );
  }
}
