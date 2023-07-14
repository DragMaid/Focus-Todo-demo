import 'package:flutter/material.dart';

class BackgroundManager extends StatefulWidget {
  const BackgroundManager({super.key});
  @override
  State<BackgroundManager> createState() => _BackgroundManagerState();
}

class _BackgroundManagerState extends State<BackgroundManager> {
  String imageLink = 'assets/background/default.png';

  void changeBackground(String link) {
    imageLink = link;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageLink),
            fit: BoxFit.cover,
          ),
        ),
        child: null,
      ),
    );
  }
}
