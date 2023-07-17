import 'package:flutter/material.dart';
import 'package:paramatt/karsilama.dart';

class Sifremi_Unuttum extends StatefulWidget {
  const Sifremi_Unuttum({super.key});

  @override
  State<Sifremi_Unuttum> createState() => _Sifremi_UnuttumState();
}

class _Sifremi_UnuttumState extends State<Sifremi_Unuttum> {
  var mailController = TextEditingController();
  var number1Controller = TextEditingController();
  var number2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Şifremi Unuttum",
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Color(0xffFF43A047),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffFFF1F8E9), Color(0xffFF81C784)]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: ekranYuksekligi / 30),
                  child: Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "E-mail",
                      ),
                      controller: mailController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
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
                        hintText: "Yeni Şifre",
                      ),
                      controller: number1Controller,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.number,
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
                        hintText: "Şifre Tekrar",
                      ),
                      controller: number2Controller,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.number,
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Uyarı"),
                                content: Text(
                                    "Şifre değiştirme işeminiz başarıyla tamamlandı!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("İptal"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Karsilama()));
                                    },
                                    child: Text("Tamam"),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text("Şifremi Değiştir"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFF43A047),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
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
