import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $args'), centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,),
      body: TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('Back')),
    );
  }
}
