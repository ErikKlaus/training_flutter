import 'package:flutter/material.dart';

class Day8 extends StatelessWidget {
  const Day8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text("Joko"),
            const SizedBox(height: 50),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,
              children: [
                Container(height: 400, width: 500, color: Colors.blue),
                Container(height: 300, width: 400, color: Colors.red),
                Container(height: 150, width: 200, color: Colors.black),
                Container(height: 50, width: 100, color: Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
