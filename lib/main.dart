import 'package:flutter/material.dart';
import 'package:ztm_bootcamp/pages/first.dart';
import 'package:ztm_bootcamp/pages/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/':(context) => const MyHomePage(),
        '/first':(context) => const FirstPage(),
        '/second':(context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.blue.shade400,
    foregroundColor: Colors.white,
    title: Text('Navigation'),
      centerTitle: true,
    ),

      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/ya.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade200, width: 3), borderRadius: BorderRadius.circular(8)),
                label: Text('Username'),
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Notifications  '),
                Switch(
                    value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue.shade400)
              ],
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.blue.shade400,
                foregroundColor: Colors.white
              ),
              child: Text('Save'),
            ),

            TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FirstPage(name: 'Vala',)));
                },
                child: Text('First Page')),
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/second', arguments: 'Jeremy');
                },
                child: Text('Second Page')),


          ]

          ),
      ),
      );

  }
}
