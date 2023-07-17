import 'package:flutter/material.dart';
import 'package:paramatt/karsilama.dart';

class Kayit_Ol extends StatefulWidget {
  const Kayit_Ol({super.key});

  @override
  State<Kayit_Ol> createState() => _Kayit_OlState();
}

class _Kayit_OlState extends State<Kayit_Ol> {
  var tfController = TextEditingController();
  var nmController = TextEditingController();
  var snmController = TextEditingController();
  var num1Controller = TextEditingController();
  var num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kaydol",
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
                        hintText: "İsim",
                      ),
                      controller: nmController,
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
                        hintText: "Soyisim",
                      ),
                      controller: snmController,
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
                        hintText: "E-mail",
                      ),
                      controller: tfController,
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
                        hintText: "Şifre",
                      ),
                      controller: num1Controller,
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
                      controller: num2Controller,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Karsilama()));
                      },
                      child: Text("Kaydol"),
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
