import 'package:flutter/material.dart';

class day_7 extends StatelessWidget {
  const day_7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'J Meme',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/face.jpeg', height: 200),
          ],
        ),
      ),
    );
  }
}
