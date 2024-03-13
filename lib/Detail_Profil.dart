import 'package:flutter/material.dart';

import 'Layout/Style/StyleApp.dart';
import 'Layout/Widget/ButtonStyles.dart';
import 'Layout/Widget/PasswordFormFieldStyles.dart';
import 'Layout/Widget/TextFormFieldStyles.dart';
import 'Login.dart';

class Detail_Profil extends StatefulWidget {
  @override
  _Detail_ProfilState createState() => _Detail_ProfilState();
}

class _Detail_ProfilState extends State<Detail_Profil> {
  bool _obscuretext = true;
  final TextEditingController _NamaController = TextEditingController();
  final TextEditingController _NikController = TextEditingController();
  final TextEditingController _PekerjaanController = TextEditingController();
  final TextEditingController _AlamatController = TextEditingController();
  final TextEditingController _NoController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
          'Detail Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Sesuaikan nilai sesuai kebutuhan
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: AnimateTextField(
                  controller: _NamaController,
                  labelText: "Nama Lengkapmu",
                  icon: Icon(Icons.account_circle_outlined),
                  borderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                  borderAnimationColor: Colors.purple.shade800,
                  borderAnimationRadius: 6,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: AnimateTextField(
                  controller: _NikController,
                  labelText: "NIK Mu",
                  icon: Icon(Icons.numbers),
                  borderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                  borderAnimationColor: Colors.purple.shade800,
                  borderAnimationRadius: 6,
                ),
              ),
              const SizedBox(height: 10,),
              Align(
                  alignment: Alignment.center,
                  child: AnimateTextField(
                    controller: _PekerjaanController,
                    labelText: "Pekerjaanmu",
                    icon: Icon(Icons.work),
                    borderColor: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    borderAnimationColor: Colors.purple.shade800,
                    borderAnimationRadius: 6,
                  )
              ),
              const SizedBox(height: 10,),
              Align(
                  alignment: Alignment.center,
                  child: AnimateTextField(
                    controller: _AlamatController,
                    labelText: "Alamatmu",
                    icon: Icon(Icons.home_filled),
                    borderColor: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    borderAnimationColor: Colors.purple.shade800,
                    borderAnimationRadius: 6,
                  )
              ),
              const SizedBox(height: 10,),
              Align(
                  alignment: Alignment.center,
                  child: AnimateTextField(
                    controller: _NoController,
                    labelText: "No Handphonemu",
                    icon: Icon(Icons.phone_android),
                    borderColor: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    borderAnimationColor: Colors.purple.shade800,
                    borderAnimationRadius: 6,
                  )
              ),
              const SizedBox(height: 10,),
              Align(
                  alignment: Alignment.center,
                  child: AnimateTextField(
                    controller: _usernameController,
                    labelText: "Email Kamu",
                    icon: Icon(Icons.mail),
                    borderColor: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    borderAnimationColor: Colors.purple.shade800,
                    borderAnimationRadius: 6,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}