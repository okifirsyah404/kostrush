import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/BuatSandi.dart';
import 'package:kostrushapp/Layout/Style/StyleApp.dart';
import 'package:kostrushapp/Layout/Widget/ButtonStyles.dart';
import 'package:kostrushapp/Layout/Widget/PasswordFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/SingleChildScrollStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextFormFieldStyles.dart';
import 'package:kostrushapp/Layout/Widget/TextStyles.dart';

import 'Login.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfil();
}

class _EditProfil extends State<EditProfil> {
  bool _obscuretext = true;
  final TextEditingController _NamaController = TextEditingController();
  final TextEditingController _PekerjaanController = TextEditingController();
  final TextEditingController _AlamatController = TextEditingController();
  final TextEditingController _NoController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
        title: Text(
          "Edit Profil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade300,
      ),

      body: SafeArea(
        child: FadeVerticalScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                // Tambahkan widget untuk foto profil
            InkWell(
              onTap: () {
                // Tambahkan logika untuk mengganti atau mengedit foto profil
                // Misalnya, tampilkan dialog atau navigasi ke halaman pengaturan foto profil
                // Di sini, saya hanya menampilkan pesan di console
                print("Edit Foto Profil");
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.camera_enhance_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple.shade800,
                      ),
                      child: Icon(
                        Icons.camera,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
                const SizedBox(height: 8,),
                InkWell(
                  onTap: () {
                    // Tambahkan logika untuk mengganti atau mengedit foto profil
                    // Misalnya, tampilkan dialog atau navigasi ke halaman pengaturan foto profil
                    // Di sini, saya hanya menampilkan pesan di console
                    print("Edit Foto Profil");
                  },
                  child: Text(
                    "Tambah Foto",
                    style: TextStyle(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold,
                    ),
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
                    labelButton: "Simpan",
                    labelProgress: "Memproses",
                    labelButtonStyle: StyleApp.largeTextStyle.copyWith(color: Colors.white),
                    height: 50,
                    containerColor: Colors.purple.shade800,
                    containerRadius: 6,
                    onTap: () async {
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                // ... (Bagian kode lainnya tetap sama)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
