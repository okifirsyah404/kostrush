import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/Layout/Style/StyleApp.dart';
import 'package:kostrushapp/Layout/Widget/ButtonStyles.dart';
import 'package:kostrushapp/Layout/Widget/PasswordFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextStyles.dart';

class   BuatSandi extends StatefulWidget {
  const BuatSandi({super.key});

  @override
  State<BuatSandi> createState() => _BuatSandiState();
}

class _BuatSandiState extends State<BuatSandi> {
  bool _obscuretext = true;
  final TextEditingController _KataSandiController = TextEditingController();
  final TextEditingController _KonfirmasiSandiController = TextEditingController();

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
                    "Buat Kata Sandi",
                    style: StyleApp.largeTextStyle.copyWith(fontWeight: FontWeight.bold)
                ),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Text(
                    "Silahkan masukkan kata sandi baru",
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
      ),
    );
  }
}
