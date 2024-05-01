part of 'adaptive_picker.dart';

class PickerItem<T> {
  final T id;
  final String label;
  final Widget? leading;
  final String? image;

  PickerItem({required this.id, required this.label, this.leading, this.image})
      : assert(leading == null && image == null ||
            leading != null && image == null ||
            leading == null && image != null);

  @override
  String toString() {
    return 'PickerItem(id: $id, label: $label)';
  }
}
