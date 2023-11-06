import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/time_horizons/time_horizons.dart';

class TimeHorizonChips extends StatefulWidget {
  final TimeHorizon initialState;
  final void Function(TimeHorizon) onSelectionChanged;

  const TimeHorizonChips(
      {super.key,
      required this.initialState,
      required this.onSelectionChanged});

  @override
  State<TimeHorizonChips> createState() => _TimeHorizonChipsState();
}

class _TimeHorizonChipsState extends State<TimeHorizonChips> {
  late TimeHorizon _state;

  @override
  void initState() {
    _state = widget.initialState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 15.0,
        children: [
          ChoiceChip(
            showCheckmark: false,
            label: Text('Week'),
            selected: _state == TimeHorizon.week,
            onSelected: (value) {
              setState(() => _state = TimeHorizon.week);
              widget.onSelectionChanged(TimeHorizon.week);
            },
          ),
          ChoiceChip(
            showCheckmark: false,
            label: Text('1m'),
            selected: _state == TimeHorizon.month,
            onSelected: (value) {
              setState(() => _state = TimeHorizon.month);
              widget.onSelectionChanged(TimeHorizon.month);
            },
          ),
          ChoiceChip(
            showCheckmark: false,
            label: Text('3m'),
            selected: _state == TimeHorizon.threeMonths,
            onSelected: (value) {
              setState(() => _state = TimeHorizon.threeMonths);
              widget.onSelectionChanged(TimeHorizon.threeMonths);
            },
          ),
          ChoiceChip(
            showCheckmark: false,
            label: Text('6m'),
            selected: _state == TimeHorizon.sixMonths,
            onSelected: (value) {
              setState(() => _state = TimeHorizon.sixMonths);
              widget.onSelectionChanged(TimeHorizon.sixMonths);
            },
          ),
          ChoiceChip(
            showCheckmark: false,
            label: Text('YTD'),
            selected: _state == TimeHorizon.ytd,
            onSelected: (value) {
              setState(() => _state = TimeHorizon.ytd);
              widget.onSelectionChanged(TimeHorizon.ytd);
            },
          ),
        ],
      ),
    );
  }
}
