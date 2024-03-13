import 'package:flutter/material.dart';
import 'Layout/Style/StyleApp.dart';
import 'Layout/Widget/ButtonStyles.dart';
import 'Layout/Widget/PasswordFormFieldStyles.dart';
import 'Login.dart';

class SandiBaru extends StatefulWidget {
  @override
  _SandiBaruState createState() => _SandiBaruState();
}

class _SandiBaruState extends State<SandiBaru> {
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
          'Buat Kata Sandi Baru',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10,),
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
            Align(
                alignment: Alignment.center,
                child: AnimatePasswordField(
                  controller: _KataSandiController,
                  obscureText: _obscuretext,
                  labelText: "Kata Sandimu",
                  icon: Icon(Icons.lock),
                  borderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                  borderAnimationColor: Colors.purple.shade800,
                  borderAnimationRadius: 6,
                )
            ),
            const SizedBox(height: 10,),
            Align(
                alignment: Alignment.center,
                child: AnimatePasswordField(
                  controller: _KonfirmasiSandiController,
                  obscureText: _obscuretext,
                  labelText: "Konfirmasi sandimu",
                  icon: Icon(Icons.lock),
                  borderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                  borderAnimationColor: Colors.purple.shade800,
                  borderAnimationRadius: 6,
                )
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: AnimateProgressButton(
                labelButton: "Buat Kata Sandi Baru",
                labelProgress: "Memproses",
                labelButtonStyle: StyleApp.largeTextStyle.copyWith(color: Colors.white),
                height: 50,
                containerColor: Colors.purple.shade800,
                containerRadius: 6,
                onTap: () async {
                  Future.delayed(Duration(seconds: 3));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
