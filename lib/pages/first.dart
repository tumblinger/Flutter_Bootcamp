import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String? name;
  const FirstPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $name'), centerTitle: true,
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
