import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedCopy;
  final VoidCallback onClickedClear;

  const TextAreaWidget({
    @required this.text,
    @required this.onClickedCopy,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: SelectableText(
                  text.isEmpty ? 'Scan an Image to get text' : text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.copy, color: Colors.black),
                color: Colors.grey[200],
                onPressed: onClickedCopy,
              ),
              SizedBox(height: 10),
              IconButton(
                icon: Icon(Icons.clear, color: Colors.black),
                color: Colors.grey[200],
                onPressed: onClickedClear,
              ),
            ],
          )
        ],
      );
}
