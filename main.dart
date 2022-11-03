import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'first-pg' :(context) => FirstPage(),
        //'second-pg' :(context) => SecondPage(),
      },
      onGenerateRoute:(settings) {
        if(settings.name == 'second-pg')
        {
        return MaterialPageRoute(builder: (context) => SecondPage(), );
        }
        else{
        return MaterialPageRoute(builder: (context) => FirstPage(), );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("First Page"),
              onPressed: () {
                        Navigator.pushNamed(context, 'first-pg');
              },
            ),
             ElevatedButton(
              child: const Text("Second Page"),
              onPressed: () {
                Navigator.pushNamed(context, 'second-pg');
              },
            ),
          ],
        ),
      ),
    );
  }
}
