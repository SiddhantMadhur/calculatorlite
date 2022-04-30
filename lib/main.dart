import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
                padding: const EdgeInsets.all(20.0),
                child: Transform.scale(
                  scale: 2.0,
                  child: Text(_output),
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
                            child: Text('AC'),
                            onPressed: () {
                              setState(() {
                                _output = "0";
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
                              setState(() {
                                _themeSelected = 0;
                              });
                            },
                            child: Text('🔃'),
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
                            child: Text('7'),
                            onPressed: () {
                              setState(() {
                                _output = "0";
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
                            child: Text('8'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _themeSelected = 0;
                              });
                            },
                            child: Text('9'),
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
                            child: Text('4'),
                            onPressed: () {
                              setState(() {
                                _output = "0";
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
                            child: Text('5'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _themeSelected = 0;
                              });
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
                              setState(() {
                                _output = "0";
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
                            child: Text('2'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _themeSelected = 0;
                              });
                            },
                            child: Text('3'),
                          ),
                          ElevatedButton(
                            child: Text('+'),
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
                            child: Text('0'),
                            onPressed: () {
                              setState(() {
                                _output = "0";
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _themeSelected = 0;
                              });
                            },
                            child: Text('.'),
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
