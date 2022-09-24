import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final gambar = [
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
  ];
  final text = [
    'Pique Bilang Wasit Untungkan Madrid, Koeman Tepok Jidat',
    'Rangkuman Hasil Pertandingan Sepak Bola Eropa Hari Sabtu dan Minggu',
    'Bersiap-siap! Pertandingan Sepak Bola Dihadiri Penonton Mulai 1 Agustus',
    'Kamu Mau Nonton Pertandingan Sepak Bola Secara Langsung? Ikuti Tips Berikut',
    '10 Pertandingan Sepak Bola Ini Dijuluki Laga Klasik',
  ];
  final tanggal = [
    'Jakarta Feb 13, 2022',
    'Jakarta Feb 20, 2022',
    'Jakarta Mei 1 2022',
    'Jakarta Jun 22, 2022',
    'Jakarta Ags 16, 2022',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('MyApp'),
                  bottom: const TabBar(tabs: [
                    Text('BERITA TERBARU'),
                    Text('PERTANDINGAN HARI INI'),
                  ]),
                ),
                body: TabBarView(children: <Widget>[
                  Column(children: [
                    Trending(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: text.length,
                        itemBuilder: (context, index) {
                          return Berita(index);
                        },
                      ),
                    )
                  ]),
                  Center(
                    child: MyApp(),
                  )
                ]))));
  }

  Trending() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.purple)),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/1.jpeg'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text(
              "Costa Mendekat ke Palmeiras",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Colors.purpleAccent,
            child: const Text("Transfer"),
          ),
        ],
      ),
    );
  }

  Berita(int index) {
    return Container(
      width: 50,
      margin: const EdgeInsets.all(10.0),
      padding: EdgeInsets.all(1),
      color: Colors.indigo,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/' + gambar[index].toString(),
                fit: BoxFit.contain,
                height: 110,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.all(1),
                  color: Colors.white,
                  height: 110,
                  width: 210,
                  alignment: Alignment.centerLeft,
                  child: Text(text[index]),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(14),
            width: double.infinity,
            color: Colors.white,
            child: Text(
              tanggal[index],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
