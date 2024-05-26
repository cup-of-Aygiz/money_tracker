import 'package:flutter/material.dart';
import 'package:money_tracker/uikit/uikit.dart';

class SwitchEnumDropDown<T> extends StatefulWidget {
  const SwitchEnumDropDown({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
    required this.items,
    this.padding,
    required this.textTile,
    this.titleTextColor,
    this.textColor,
  });

  final String labelText;
  final T initialValue;
  final Function(T) onChanged;
  final List<T> items;
  final String Function(T) textTile;
  final Color? Function(T)? titleTextColor;
  final Color? textColor;
  final EdgeInsets? padding;

  @override
  SwitchEnumDropDownState<T> createState() => SwitchEnumDropDownState<T>();
}

class SwitchEnumDropDownState<T> extends State<SwitchEnumDropDown<T>> {
  late T _selectedValue;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    _controller.value = TextEditingValue(
      text: widget.textTile(_selectedValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      readOnly: true,
      onTap: _openDropDown,
      labelText: widget.labelText,
      controller: _controller,
      textColor: widget.textColor,
    );
  }

  void _openDropDown() {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final List<PopupMenuEntry<T>> popupItems = widget.items.map((item) {
      Color? color;
      if (widget.titleTextColor != null) {
        color = widget.titleTextColor!(item);
      }
      return PopupMenuItem<T>(
        value: item,
        child: SizedBox(
          width: overlay.size.width,
          child: Text(
            widget.textTile(item),
            style: AppTextStyle.body1Medium.copyWith(
              color: color ?? AppColors.white,
            ),
          ),
        ),
      );
    }).toList();

    showMenu<T>(
      context: context,
      position: position,
      items: popupItems,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedValue = value;
        });
        _controller.value = TextEditingValue(
          text: widget.textTile(value),
        );
        widget.onChanged(value);
      }
    });
  }
}
