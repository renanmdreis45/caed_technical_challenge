import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final String? error;
  final TextEditingController? controller;
  final Function? hasError;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final List<String>? autofillHints;
  final bool autoClearError;
  final Color errorColor;
  final TextInputAction textInputAction;
  final Color fillColor;

  CustomTextField({
    this.label,
    this.placeholder,
    this.controller,
    this.hasError,
    this.onChanged,
    this.error,
    this.textInputType,
    this.obscureText = false,
    this.validator,
    this.autofillHints,
    this.autoClearError = false,
    this.errorColor = Colors.red,
    this.textInputAction = TextInputAction.done,
    this.fillColor = inputBgColor,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController? _controller;
  bool _hideIcon = true;
  void _toggleHidePassword() => setState(() => _hideIcon = !_hideIcon);

  InputBorder _inputBorder({required double width, required Color color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: width, color: color),
      );
  Widget get _suffixIcon => (widget.error != null && widget.error!.isNotEmpty)
      ? Icon(Icons.error, color: widget.errorColor)
      : widget.obscureText && _controller!.text.isNotEmpty
          ? IconButton(
              onPressed: _toggleHidePassword,
              icon: Icon(_hideIcon ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey))
          : Icon(null);

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  build(_) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          Align(alignment: Alignment.topLeft, child: Text(widget.label!, style: TextStyle(color: Color(0xFF757575), fontSize: 14), textAlign: TextAlign.end,)),
          SizedBox(height: 3,),
          TextFormField(
            autofillHints: widget.autofillHints,
            validator: widget.validator,
            enabled: true,
            autocorrect: false,
            keyboardType: widget.textInputType,
            onChanged: (value) {
              widget.onChanged!(value);
            },
            controller: _controller,
            style: TextStyle(color: Colors.black),
            obscureText: widget.obscureText ? _hideIcon : false,
            decoration: InputDecoration(
              suffixIcon: _suffixIcon,
              filled: true,
              fillColor: widget.fillColor,
              border: _inputBorder(width: 2, color: Color(0xFF505A72)),
              errorBorder: _inputBorder(width: 2, color: widget.errorColor),
              focusedBorder: _inputBorder(width: 2, color: Color(0xFF505A72)),
              disabledBorder: _inputBorder(width: 1, color: Colors.orange),
              focusedErrorBorder: _inputBorder(width: 2, color: Colors.white),
              enabledBorder: _inputBorder(width: 2, color: Colors.white),
              hintText: widget.placeholder,
              hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
              // labelText: widget.label,
              // labelStyle: TextStyle(color: Color(0xFF757575)),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              errorText: widget.error,
              errorStyle: TextStyle(color: widget.errorColor),
            ),
            textInputAction: widget.textInputAction,
          ),
        ]),
      );
}
