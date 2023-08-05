// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Counter extends StatelessWidget {
  final int taskesDone;
  final int allTaskes;
  const Counter({super.key, required this.allTaskes, required this.taskesDone});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "$taskesDone/$allTaskes",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: taskesDone == allTaskes ? Colors.green : Colors.white),
      ),
    );
  }
}
