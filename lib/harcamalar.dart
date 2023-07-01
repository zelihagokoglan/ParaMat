import 'package:flutter/material.dart';

class Harcamalar extends StatefulWidget {
  const Harcamalar({super.key});

  @override
  State<Harcamalar> createState() => _HarcamalarState();
}

class _HarcamalarState extends State<Harcamalar> {
  var kategoriler = ["Mutfak", "Eğlence", "Giyim", "Diğer Harcamalar"];
  bool? sil = false;
  String kullanicigirdi = '';

  void removeCard(int index) {
    setState(() {
      kategoriler.removeAt(index);
    });
  }

  void addCard() {
    setState(() {
      kategoriler.add(('$kullanicigirdi'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Harcamalarm",
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Color(0xffFF43A047),
      ),
      body: ListView.builder(
        itemCount: kategoriler.length,
        itemBuilder: (context, indexs) {
          return SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Kategori_iceril()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      print("tıklandı");
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Text(kategoriler[indexs]),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              if (sil == true) ;
                              return removeCard(indexs);
                            },
                            child: Text("Sil"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addCard();
        },
      ),
    );
  }
}
