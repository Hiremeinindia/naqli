import 'package:flutter/material.dart';

class TextFieldWithButton extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onPressed;

  const TextFieldWithButton({
    this.controller,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter text...',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
            width: 8.0), // Add some space between the TextField and the button
        ElevatedButton(
          onPressed: onPressed,
          child: Text('Submit'),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField with Button Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWithButton(
              controller: _textController,
              onPressed: () {
                String text = _textController.text;
                print('Entered text: $text');
                _textController.clear();
              },
            ),
            // Add more widgets below if needed
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}
