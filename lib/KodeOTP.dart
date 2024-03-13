import 'package:flutter/material.dart';
import 'package:kostrushapp/LupaSandi.dart';

import 'Layout/Style/StyleApp.dart';
import 'Layout/Widget/ButtonStyles.dart';
import 'VerifikasiBerhasil.dart';

class KodeOTP extends StatefulWidget {
  const KodeOTP({Key? key}) : super(key: key);

  @override
  State<KodeOTP> createState() => _KodeOTPState();
}

class _KodeOTPState extends State<KodeOTP> {
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
              MaterialPageRoute(builder: (context) => LupaSandi()), // Gantilah dengan class halaman login yang sebenarnya
            );
          },
        ),
        title: Text(
          "Kode OTP",
          style: TextStyle(fontWeight: FontWeight.bold), // Menambah properti TextStyle untuk membuat teks menjadi bold
        ),
        backgroundColor: Colors.purple.shade300, // Mengubah warna menjadi ungu
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Masukkan Kode OTP yang telah dikirim ke alamat email Anda',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < 4; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2.0), // Adjust to desired margin
                    width: 40.0,
                    height: 40.0,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            IntrinsicWidth(
              child: Row(
                children: [
                  Expanded(
                    child: Text('Belum menerima kode OTP?',
                        style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Kirim Ulang'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: AnimateProgressButton(
                labelButton: "Konfirmasi",
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
