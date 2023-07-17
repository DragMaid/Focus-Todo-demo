import 'package:flutter/material.dart';

class CreditWidget extends StatelessWidget {
  const CreditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(254, 231, 212, 1),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/QR.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
          ),
        ));
  }
}
