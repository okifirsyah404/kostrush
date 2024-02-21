import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/Layout/Style/StyleApp.dart';
import 'package:kostrushapp/Layout/Widget/ButtonStyles.dart';
import 'package:kostrushapp/Layout/Widget/PasswordFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextStyles.dart';

class   LupaSandi extends StatefulWidget {
  const LupaSandi({super.key});

  @override
  State<LupaSandi> createState() => _LupaSandiState();
}

class _LupaSandiState extends State<LupaSandi> {
  bool _obscuretext = true;
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Text(
                    "Lupa Kata Sandi",
                    style: StyleApp.largeTextStyle.copyWith(fontWeight: FontWeight.bold)
                ),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Text(
                    "Silahkan masukkan email anda",
                    style: StyleApp.largeTextStyle.copyWith(fontWeight: FontWeight.normal)
                ),
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
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: AnimateProgressButton(
                  labelButton: "Lanjut",
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
      ),
    );
  }
}
