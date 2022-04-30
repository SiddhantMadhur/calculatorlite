import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _output = "Not submitted";

  void manageInput(target) {
    var input = target.toString();
    var flg = false;

    var test = input.split('+');
    var sum = 0;
    if (test.length == 0) {
      _output = '0';
    } else {
      test.forEach((element) {
        sum = sum + int.parse(element);
      });
    }
    setState(() {
      _output = sum.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Center(
          child: Text('Calculator--'),
        ),
      ),
      body: Transform.scale(
        scale: 1.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Transform.scale(
                  scale: 2.0,
                  child: Text(_output),
                ),
              ),
              SizedBox(
                width: 300.0,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Calculation',
                  ),
                  onChanged: manageInput,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
