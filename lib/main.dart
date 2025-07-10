import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Substack Clone',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final RegExp emailValid = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        title: Text('Substack Clone'),
        centerTitle: true,
    ),

      body: Form(
        key: _signInKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'email'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please enter an email";
                } 
                return null;
              },
            ), //email

            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'password'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please enter a password";
                } else if(value.length < 6){
                  return  "Password must be at least 6 characters";
                }
                return null;
              },
            ), //password

            ElevatedButton(onPressed: (){
              if(_signInKey.currentState!.validate()){
                debugPrint('Email: ${_emailController.text}');
                debugPrint('Password: ${_passwordController.text}');
              }

            }, child: Text('Continue'))
          ],
        ),
      )
      );

  }
}

