import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function() action;
  final Color? bgColor;
  final Color? textColor;
  final Size? size;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final bool? wrapContent;
  const ActionButton(
      {Key? key,
      required this.title,
      required this.action,
      this.bgColor,
      this.textColor,
      this.size,
      this.padding,
      this.width,
      this.wrapContent})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getWidth(),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ButtonTheme(
        height: this.size == null ? 55 : this.size!.height,
        child: ElevatedButton(
          child: Text(title,
              style: TextStyle(
                  color: this.textColor == null ? Colors.white : this.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          style: _buttonStyle(),
          onPressed: action,
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: this.bgColor,
      padding: this.padding ?? EdgeInsets.all(16),
      minimumSize: this.size ?? Size(55, 55),
    );
  }

  double? _getWidth() {
    if (wrapContent != null) return null;

    if (width != null) return width;

    return double.infinity;
  }
}
