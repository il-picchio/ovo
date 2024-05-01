part of 'adaptive_picker.dart';

class AndroidPicker<T> extends StatelessWidget {
  final Iterable<PickerItem<T>> items;
  final void Function(PickerItem<T>?) onChanged;
  final T selectedId;
  final bool showIcon;

  const AndroidPicker(
      {super.key,
      required this.items,
      required this.selectedId,
      required this.onChanged,
      required this.showIcon});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width < 400 ? 10 : 15;
    return DropdownButtonFormField<T>(
      isDense: true,
      isExpanded: true,
      value: selectedId,
      items: items
          .map(
            (e) => DropdownMenuItem<T>(
              value: e.id,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: e.leading == null
                    ? Text(e.label)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: e.leading,
                            radius: size,
                          ),
                          SizedBox(
                            width: size,
                          ),
                          Flexible(
                            child: Text(
                              e.label,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),),
            ),
          )
          .toList(growable: false),
      selectedItemBuilder: !showIcon
          ? (context) => items.map((e) => Center(child: Text(e.label))).toList(growable: false)
          : null,
      onChanged: (e) =>
          onChanged(items.firstWhere((element) => element.id == e)),
    );
  }
}
