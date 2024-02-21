import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/BuatSandi.dart';
import 'package:kostrushapp/Layout/Style/StyleApp.dart';
import 'package:kostrushapp/Layout/Widget/ButtonStyles.dart';
import 'package:kostrushapp/Layout/Widget/PasswordFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/SingleChildScrollStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextStyles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
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
      body: SafeArea(
        child: FadeVerticalScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "Daftarkan Akun Anda",
                      style: StyleApp.largeTextStyle.copyWith(fontWeight: FontWeight.bold)
                  ),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "Silahkan masukkan kata sandi anda",
                      style: StyleApp.largeTextStyle.copyWith(fontWeight: FontWeight.normal)
                  ),
                ),
                const SizedBox(height: 20,),
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
                    )
                ),
                const SizedBox(height: 10,),
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
                    )
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
                     Get.off(BuatSandi());
                    },
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
