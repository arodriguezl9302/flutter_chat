import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
          hintText: 'Tu mensaje termina con "?"',
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {
                final text = textController.value.text;
                onValue(text);
                textController.clear();
                focusNode.requestFocus();
              },
              icon: const Icon(Icons.send_outlined))),
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('changed $value');
      // },
    );
  }
}
