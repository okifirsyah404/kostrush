import 'package:flutter/material.dart';

class VerifikasiBerhasil extends StatelessWidget {
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
                " Registerasi Berhasil",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50,),
              Image.asset('assets/images/berhasil.png'),
              const SizedBox(height: 50,),
              Text(
                "Akun Anda telah berhasil didaftarkan.",
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
