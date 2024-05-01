part of 'adaptive_picker.dart';

class CupertinoPicker<T> extends StatefulWidget {
  final Iterable<PickerItem<T>> items;
  final T selectedId;
  final void Function(PickerItem<T>?) onChanged;
  final bool showIcon;

  const CupertinoPicker(
      {super.key,
      required this.items,
      required this.selectedId,
      required this.onChanged,
      required this.showIcon});

  @override
  State<CupertinoPicker<T>> createState() => _CupertinoPickerState<T>();
}

class _CupertinoPickerState<T> extends State<CupertinoPicker<T>> {
  late T selectedId;

  @override
  void initState() {
    selectedId = widget.selectedId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem =
        widget.items.firstWhere((element) => element.id == selectedId);
    return PullDownButton(
      itemBuilder: (context) => widget.items
          .map(
            (e) => PullDownMenuItem.selectable(
              selected: e.id == selectedId,
              iconWidget: e.leading,
              title: e.label,
              onTap: () {
                setState(() => selectedId = e.id);
                widget.onChanged(e);
              },
            ),
          )
          .toList(growable: false),
      buttonBuilder: (context, showMenu) => CupertinoListTile(
        leading: selectedItem.leading != null && widget.showIcon
            ? CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
                child: selectedItem.leading,
              )
            : null,
        title: Text(selectedItem.label),
        trailing: const Icon(
          CupertinoIcons.chevron_up_chevron_down,
          size: 16,
        ),
        onTap: showMenu,
        backgroundColorActivated: Colors.transparent,
      ),
    );
  }
}
