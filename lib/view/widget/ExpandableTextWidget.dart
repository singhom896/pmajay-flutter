import 'package:flutter/cupertino.dart';




class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle textStyle;
  const ExpandableTextWidget({
    required this.text,
    required this.maxLines, // Default to 2 lines
    required this.textStyle , // Default to 2 lines
  });

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Text(
        widget.text,
        maxLines: _isExpanded ? null : widget.maxLines,
        overflow: TextOverflow.ellipsis,
        style:widget.textStyle
      ),
    );
  }
}