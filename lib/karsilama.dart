import 'package:flutter/material.dart';
import 'package:paramatt/Sifremi_Unuttum.dart';
import 'package:paramatt/harcamalar.dart';
import 'package:paramatt/kayit_ol.dart';

class Karsilama extends StatefulWidget {
  const Karsilama({super.key});

  @override
  State<Karsilama> createState() => _KarsilamaState();
}

class _KarsilamaState extends State<Karsilama> {
  var mlController = TextEditingController();
  var sfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              0.6,
              0.9,
            ],
            colors: [
              Color(0xffFFF1F8E9),
              Color(0xffFFC8E6C9),
              Color(0xffFF81C784),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: ekranGenisligi / 2.0),
                  child: Text(
                    "ParaMat'a",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: ekranYuksekligi / 15.0,
                      right: ekranGenisligi / 2.5),
                  child: Text(
                    "Hoşgeldiniz...",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: ekranYuksekligi / 30),
                  child: Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "E-mail",
                      ),
                      controller: mlController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: ekranYuksekligi / 30),
                  child: Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Şifre",
                      ),
                      controller: sfController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ekranYuksekligi / 10.0),
                  child: Container(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Harcamalar()));
                        Text("Giriş Yapıldı");
                      },
                      child: Text("Giriş Yap"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFF43A047),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sifremi_Unuttum()));
                  },
                  child: Text(
                    "Şifreni mi unuttun ?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kayit_Ol()));
                  },
                  child: Text(
                    "Kaydol ?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
