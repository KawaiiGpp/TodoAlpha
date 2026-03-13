import 'package:flutter/material.dart';
import 'package:to_do_alpha/util/light_dialog.dart';

class TextFieldDialog extends StatefulWidget {
  final Widget title;
  final String hintText;
  final ValueChanged<String> onSubmit;
  final String? Function(String input) onInputCheck;

  const TextFieldDialog({
    super.key,
    required this.title,
    required this.hintText,
    required this.onSubmit,
    required this.onInputCheck,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TextFieldDialog> {
  final _controller = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return LightDialog(
      title: widget.title,

      content: TextField(
        controller: _controller,

        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: _errorMessage,
        ),
      ),

      onConfirm: _onConfirm,
    );
  }

  void _onConfirm() {
    final text = _controller.text;
    final error = widget.onInputCheck(text);

    if (error != null) {
      setState(() => _errorMessage = error);
    } else {
      widget.onSubmit(text);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
