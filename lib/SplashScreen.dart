import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kostrushapp/BuatSandi.dart';
import 'package:kostrushapp/EditProfil.dart';
import 'package:kostrushapp/KodeOTP.dart';
import 'package:kostrushapp/Login.dart';
import 'package:kostrushapp/Pemesanan.dart';
import 'package:kostrushapp/Register.dart';
import 'package:kostrushapp/SandiBaru.dart';

import 'Layout/Style/StyleApp.dart';
import 'Layout/Widget/ButtonStyles.dart';
import 'Layout/Widget/PasswordFormFieldStyles.dart';
import 'Layout/Widget/TextFormFieldStyles.dart';
import 'Layout/Widget/TextStyles.dart';
import 'LupaSandi.dart';
import 'VerifikasiBerhasil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 10,),
            Text(
              "KostRush",
              style: TextStyle(fontSize: 24),
            ),
            // ... (other elements in your SplashScreen UI)
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {
  bool _obscuretext = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "Selamat Datang di\nKostRush Nganjuk",
                      style: StyleApp.largeTextStyle.copyWith(
                          fontWeight: FontWeight.bold)
                  ),
                ),
                const SizedBox(height: 10,),
                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "KostRush",
                      style: StyleApp.largeTextStyle.copyWith()
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
                    child: AnimatePasswordField(
                      controller: _passwordController,
                      obscureText: _obscuretext,
                      labelText: "Password Kamu",
                      icon: Icon(Icons.lock),
                      borderColor: Colors.grey,
                      borderRadius: BorderRadius.circular(6),
                      borderAnimationColor: Colors.purple.shade800,
                      borderAnimationRadius: 6,
                    )
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      print("ditekan");
                      Get.off(LupaSandi());
                    },
                    child: Text(
                        "Lupa Kata Sandi",
                        style: StyleApp.mediumTextStyle.copyWith()
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: AnimateProgressButton(
                    labelButton: "Masuk",
                    labelProgress: "Memproses",
                    labelButtonStyle: StyleApp.largeTextStyle.copyWith(
                        color: Colors.white),
                    height: 50,
                    containerColor: Colors.purple.shade800,
                    containerRadius: 6,
                    onTap: () async {
                      Future.delayed(Duration(seconds: 3));
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Belum Punya Akun?",
                        style: StyleApp.largeTextStyle.copyWith()
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        Get.off(EditProfil());
                      },
                      child: Text(
                          "Daftar",
                          style: StyleApp.largeTextStyle.copyWith(
                              color: Colors.blue
                          )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      LineText(
                        text: "atau",
                        lineColor: Colors.grey,
                        lineWidth: 100,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk masuk menggunakan akun Google di sini
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Masuk dengan Google',
                              style: TextStyle(color: Colors.black),  // Set text color to black
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
