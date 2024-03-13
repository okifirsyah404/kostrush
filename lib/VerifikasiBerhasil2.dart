import 'package:flutter/material.dart';

class VerifikasiBerhasil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kata Sandi Berhasil Diubah",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50,),
              Image.asset('assets/images/berhasil2.png'),
              const SizedBox(height: 50,),
              Text(
                "Jangan pernah membagikan kata sandi\nAnda kepada siapa pun.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
