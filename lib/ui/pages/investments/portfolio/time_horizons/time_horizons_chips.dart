import 'package:flutter/material.dart';
import 'package:ovo/ui/common/widgets/chip.dart';
import 'package:ovo/ui/pages/investments/portfolio/time_horizons/time_horizons.dart';

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
          OvoChip(
            selected: _state == TimeHorizon.week,
            text: 'Week', 
            onTap: () {
              setState(() => _state = TimeHorizon.week);
              widget.onSelectionChanged(TimeHorizon.week);
            },
          ),
          OvoChip(
            selected: _state == TimeHorizon.month,
            text: '1m', 
            onTap: () {
              setState(() => _state = TimeHorizon.month);
              widget.onSelectionChanged(TimeHorizon.month);
            },
          ),
          OvoChip(
            selected: _state == TimeHorizon.threeMonths,
            text: '3m', 
            onTap: () {
              setState(() => _state = TimeHorizon.threeMonths);
              widget.onSelectionChanged(TimeHorizon.threeMonths);
            },
          ),
          OvoChip(
            selected: _state == TimeHorizon.sixMonths,
            text: '6m', 
            onTap: () {
              setState(() => _state = TimeHorizon.sixMonths);
              widget.onSelectionChanged(TimeHorizon.sixMonths);
            },
          ),
          OvoChip(
            selected: _state == TimeHorizon.year,
            text: '1y', 
            onTap: () {
              setState(() => _state = TimeHorizon.year);
              widget.onSelectionChanged(TimeHorizon.year);
            },
          ),
          OvoChip(
            selected: _state == TimeHorizon.ytd,
            text: 'YTD', 
            onTap: () {
              setState(() => _state = TimeHorizon.ytd);
              widget.onSelectionChanged(TimeHorizon.ytd);
            },
          ),
        ],
      ),
    );
  }
}
