import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pageturn/textsample.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.pinkAccent,
      ),
      home: ExampleScreen(),
    ),
  );
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen>
    with SingleTickerProviderStateMixin {
  double dx = 0.0;
  double dy = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (detail) {
            setState(() {
              dx += detail.delta.dx;
              dy += detail.delta.dy;
              print('dx: $dx, dy: $dy');
            });
          },
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(0, 3, dx / 1.5)
              // ..setEntry(1, 3, dy)
              ..setEntry(3, 2, -0.0005)
              ..rotateY(dx / 100),
            alignment: FractionalOffset.centerLeft,
            child: Container(
              color: Colors.blueAccent,
              child: Text(TextSample.getTextSample()),
            ),
          ),
        ),
      ),
    );
  }
}
