import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Layout/Style/StyleApp.dart';
import 'Layout/Widget/ButtonStyles.dart';
import 'Layout/Widget/PasswordFormFieldStyles.dart';
import 'Login.dart';

class TentangKami extends StatefulWidget {
  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {
  bool _obscuretext = true;
  final TextEditingController _KataSandiController = TextEditingController();
  final TextEditingController _KonfirmasiSandiController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),

        title: Text(
          'Tentang Kami',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: Text(
                  "Silahkan masukkan kata sandi anda",
                  style: StyleApp.largeTextStyle.copyWith(fontWeight: FontWeight.normal)
              ),
            ),
            const SizedBox(height: 10,),
            
          ]
      ),
      ),
    );
  }
}
