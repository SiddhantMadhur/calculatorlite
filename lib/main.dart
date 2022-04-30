import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String _inputVal = "0";

void calculate(int value) {}

var _themes = [
  Colors.purple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.red
];
int _themeSelected = 0;

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
  var _secondInput = "0";
  var flg = false;

  void addNumb(int input) {
    if (flg) {
      setState(() {
        _secondInput = _secondInput + input.toString();
      });
    } else {
      setState(() {
        _inputVal = _inputVal + input.toString();
      });
    }
  }

  void addition() {
    if (flg) {
      if (_secondInput.length > 0) {
        setState(() {
          var temp = int.parse(_inputVal) + int.parse(_secondInput);
          _inputVal = temp.toString();
          _secondInput = "";
        });
      }
    } else {
      flg = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themes[_themeSelected],
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
                padding: const EdgeInsets.all(5),
                child: Text(flg ? _inputVal.toString() : ''),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Transform.scale(
                  scale: 2.0,
                  child: Text(flg
                      ? _secondInput == ""
                          ? "0"
                          : _secondInput.toString()
                      : _inputVal == ""
                          ? "0"
                          : _inputVal.toString()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            child: const Text('AC'),
                            onPressed: () {
                              setState(() {
                                _inputVal = "";
                                _secondInput = "";
                                flg = false;
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_themeSelected == _themes.length - 1) {
                                setState(() {
                                  _themeSelected = 0;
                                });
                              } else {
                                setState(() {
                                  _themeSelected++;
                                });
                              }
                            },
                            child: Text('T'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (flg) {
                                setState(() {
                                  _secondInput = _secondInput.substring(
                                      0, _secondInput.length - 1);
                                });
                              } else {
                                setState(() {
                                  _inputVal = _inputVal.substring(
                                      0, _inputVal.length - 1);
                                });
                              }
                            },
                            child: const Text('C'),
                          ),
                          ElevatedButton(
                            child: Text('÷'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            child: const Text('7'),
                            onPressed: () {
                              addNumb(7);
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNumb(8);
                            },
                            child: Text('8'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNumb(9);
                            },
                            child: const Text('9'),
                          ),
                          ElevatedButton(
                            child: Text('✖'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            child: const Text('4'),
                            onPressed: () {
                              setState(() {
                                addNumb(4);
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNumb(5);
                            },
                            child: Text('5'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNumb(6);
                            },
                            child: Text('6'),
                          ),
                          ElevatedButton(
                            child: Text('-'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            child: Text('1'),
                            onPressed: () {
                              addNumb(1);
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNumb(2);
                            },
                            child: Text('2'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNumb(3);
                            },
                            child: const Text('3'),
                          ),
                          ElevatedButton(
                            child: const Text('+'),
                            onPressed: () {
                              addition();
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            child: Text('0'),
                            onPressed: () {
                              setState(() {
                                addNumb(0);
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _themeSelected = 0;
                              });
                            },
                            child: const Text('.'),
                          ),
                          ElevatedButton(
                            child: Text('='),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
