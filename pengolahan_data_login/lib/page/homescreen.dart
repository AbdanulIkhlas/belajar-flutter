import 'package:flutter/material.dart';
import 'package:pengolahan_data_login/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  /* 
    jika menggunakan require, wajib menggunakan parameter, jika optional berrti tdk wajib
    contoh code required:
    * const HomeScreen({Key? key, required this.username});
   */
  final String username;

  //* contoh opsional
  const HomeScreen({Key? key, this.username = "Nama Pengguna"});

  //* contoh required
  // const HomeScreen({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomeScreen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selamat Datang, $username"),
            ElevatedButton(
              onPressed: () {
                // ! kembali ke halmaan login
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );

                // ! link ke ig
                goToInstagram("https://www.instagram.com/abdanulikhlas_/");
              },
              child: Text("Masuk Ke Instagram"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToInstagram(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Error cannot launch $url';
    }
  }
}
