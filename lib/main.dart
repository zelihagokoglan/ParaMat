import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paramatt/karsilama.dart';

void main() {
  runApp(const ParamatApp());
}

class ParamatApp extends StatelessWidget {
  const ParamatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paramat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Karsilama(),
    );
  }
}

class Harcama {
  final DateTime tarih;
  final String aciklama;
  final String tutar;
  final DateTime olusturmaTarihi;

  Harcama({
    required this.tarih,
    required this.aciklama,
    required this.tutar,
  }) : olusturmaTarihi = DateTime.now();
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Harcama> harcamalar = [];

  final TextEditingController aciklamaController = TextEditingController();
  final TextEditingController tutarController = TextEditingController();

  final NumberFormat numberFormat = NumberFormat.decimalPattern();
  final DateFormat dateFormat = DateFormat('dd.MM.yyyy HH:mm');

  DateTime selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    tutarController.addListener(onTutarChanged);
  }

  @override
  void dispose() {
    tutarController.removeListener(onTutarChanged);
    tutarController.dispose();
    super.dispose();
  }

  void onTutarChanged() {
    setState(() {
      final text = tutarController.text;
      final parsedValue = int.tryParse(text.replaceAll(',', ''));
      if (parsedValue != null) {
        final formattedValue = numberFormat.format(parsedValue);
        tutarController.value = TextEditingValue(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );
      }
    });
  }

  void addHarcama() {
    final aciklama = aciklamaController.text;
    final tutar = '${tutarController.text} TL';

    setState(() {
      harcamalar.add(Harcama(
        tarih: selectedDateTime,
        aciklama: aciklama,
        tutar: tutar,
      ));
      aciklamaController.clear();
      tutarController.clear();
    });
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          DateTime.now().hour,
          DateTime.now().minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 14, // Yazı boyutu
    );

    double toplamTutar = 0;
    for (var harcama in harcamalar) {
      if (harcama.tarih.year == selectedDateTime.year &&
          harcama.tarih.month == selectedDateTime.month &&
          harcama.tarih.day == selectedDateTime.day) {
        final tutar = double.tryParse(
          harcama.tutar.replaceAll(' TL', '').replaceAll(',', ''),
        );
        if (tutar != null) {
          toplamTutar += tutar;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDateTime(context),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryPage(harcamalar: harcamalar),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Toplam Tutar: ${numberFormat.format(toplamTutar)} TL',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: harcamalar.length,
              itemBuilder: (BuildContext context, int index) {
                final harcama = harcamalar[index];
                if (harcama.tarih.year == selectedDateTime.year &&
                    harcama.tarih.month == selectedDateTime.month &&
                    harcama.tarih.day == selectedDateTime.day) {
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            harcama.aciklama,
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          harcama.tutar,
                          style: textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      dateFormat.format(harcama.olusturmaTarihi),
                      style: textStyle,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: aciklamaController,
                    decoration: const InputDecoration(
                      labelText: 'Açıklama',
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    controller: tutarController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Tutar',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addHarcama,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  final List<Harcama> harcamalar;

  const SummaryPage({Key? key, required this.harcamalar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.decimalPattern();
    Map<int, double> aylarToplami = {}; // Aylık toplamların saklandığı Map

    // Aylık ve yıllık toplam tutar hesaplaması
    final now = DateTime.now();
    final currentYear = now.year;
    double yillikToplam = 0;

    for (var harcama in harcamalar) {
      final tutar = double.tryParse(
          harcama.tutar.replaceAll(' TL', '').replaceAll(',', ''));
      if (tutar != null) {
        if (harcama.tarih.year == currentYear) {
          yillikToplam += tutar;
        }

        final month = harcama.tarih.month;
        aylarToplami[month] = (aylarToplami[month] ?? 0) + tutar;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Özet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text('Ay')),
                DataColumn(label: Text('Toplam Tutar')),
              ],
              rows: aylarToplami.entries.map((entry) {
                final month = entry.key;
                final toplamTutar = entry.value;
                final monthName =
                    DateFormat.MMMM().format(DateTime(currentYear, month));

                return DataRow(cells: [
                  DataCell(Text(monthName)),
                  DataCell(Text(numberFormat.format(toplamTutar))),
                ]);
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Yıllık Toplam Tutar: ${numberFormat.format(yillikToplam)} TL',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
