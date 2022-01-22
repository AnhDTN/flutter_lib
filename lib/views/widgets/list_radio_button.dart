import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListRadioButton<T> extends StatefulWidget {
  final int length;
  final List<T> values;
  final T groupValue;
  final Widget Function(T value) title;
  final Widget Function(T value) secondary;
  final void Function(T value) onChange;

  const ListRadioButton(
      {Key? key,
      required this.length,
      required this.values,
      required this.groupValue,
      required this.onChange,
      required this.title,
      required this.secondary})
      : super(key: key);

  @override
  _ListRadioButtonState createState() => _ListRadioButtonState();
}

class _ListRadioButtonState extends State<ListRadioButton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return RadioListTile(
          onChanged: widget.onChange,
          groupValue: widget.groupValue,
          value: widget.values[index],
          title: widget.title(widget.values[index]),
          secondary: widget.secondary(widget.values[index]),
        );
      },
      itemCount: widget.values.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
