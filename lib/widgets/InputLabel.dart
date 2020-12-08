import 'package:flutter/material.dart';

Widget inputLabel(String title, Function event, bool status, String text,
    TextInputType type) {
  final _controller = new TextEditingController.fromValue(TextEditingValue(
    text: text,
    selection: TextSelection.collapsed(offset: text.length),
    composing: TextRange.empty,
  ));

  return Container(
    margin: EdgeInsets.only(
      bottom: 0,
      top: 20,
    ),
    child: TextFormField(
      controller: _controller,
      onChanged: event,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: title,
        counter: Text('${text != null ? text.length : 0}'),
      ),
    ),
  );
}
