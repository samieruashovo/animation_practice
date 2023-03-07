import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const defaultWidth = 100.0;

class _HomePageState extends State<HomePage> {
  bool _isZoomedIN = false;
  String _buttonTitle = 'Zoom IN';
  double _width = defaultWidth;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                width: _width,
                curve: _curve,
                child: Image.asset('assets/images/824696.jpg'),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _isZoomedIN = !_isZoomedIN;
                  _buttonTitle = _isZoomedIN ? 'Zoom Out' : 'Zoom IN';
                  _width = _isZoomedIN
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curve = _isZoomedIN ? Curves.bounceInOut : Curves.bounceOut;
                });
              },
              child: Text(_buttonTitle)),
        ],
      ),
    );
  }
}
