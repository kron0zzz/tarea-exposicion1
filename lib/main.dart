import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const GestureExpo(),
    );
  }
}

class GestureExpo extends StatefulWidget {
  const GestureExpo({super.key});

  @override
  State<GestureExpo> createState() => _GestureExpoState();
}

class _GestureExpoState extends State<GestureExpo> {

  String _tapText = "oe dale click";
  Color _tapColor = Colors.grey;

  double _size = 100;

  Offset _position = const Offset(120, 200);

  final Random _random = Random();

  Color _randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exposición de Gestos')),

      body: Stack(
        children: [

          Positioned(
            top: _position.dy,
            left: _position.dx,
            child: GestureDetector(

              onTap: () {
                setState(() {
                  _tapText = "Tapsito";
                  _tapColor = _randomColor();
                });
              },

              onDoubleTap: () {
                setState(() {
                  _tapText = "Doble Tap";
                  _size = _size == 100 ? 200 : 100;
                });
              },

              onLongPress: () {
                setState(() {
                  _tapText = "Presión Larga";
                });
              },

              onPanUpdate: (details) {
                setState(() {
                  _position += details.delta;
                });
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _size,
                height: _size,
                decoration: BoxDecoration(
                  color: _tapColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    _tapText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}