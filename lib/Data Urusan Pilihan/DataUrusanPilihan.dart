import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/EnergidanSumberDayaMineral.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/Kehutanan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/KelautandanPerikanan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/Pariwisata.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/Perdagangan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/Perindustrian.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/Pertanian.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/Transmigrasi.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(DataUrusanPilihan());
}

Future<List<Data>> fetchData() async {
  String url = "http://10.0.2.2/job/Web_Data_Perencanaan_NTB/api/data";
  final response = await http.get(url, headers: {
    'WDP-NTB-KEY': 'alsodhr74jrhfot97264jgnd85jg7jsofjgur5',
  });
  var responseJson = json.decode(response.body);
  return (responseJson['data'] as List).map((p) => Data.fromJson(p)).toList();
}

class Data {
  final String id;
  final String idkategori;
  final String namadata;
  final String subket1;
  final String subket2;
  final String subket3;
  final String subket4;
  final String subket5;
  final String subket6;
  final String subket7;
  final String subket8;
  final String subket9;
  final String nilai;
  final String satuan;
  final String semester;
  final String tahun;
  final String createdat;
  final String updatedat;

  Data({
    this.id,
    this.idkategori,
    this.namadata,
    this.subket1,
    this.subket2,
    this.subket3,
    this.subket4,
    this.subket5,
    this.subket6,
    this.subket7,
    this.subket8,
    this.subket9,
    this.nilai,
    this.satuan,
    this.tahun,
    this.semester,
    this.createdat,
    this.updatedat,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      idkategori: json['id_kategori'],
      namadata: json['nama_data'],
      subket1: json['sub_ket1'],
      subket2: json['sub_ket2'],
      subket3: json['sub_ket3'],
      subket4: json['sub_ket4'],
      subket5: json['sub_ket5'],
      subket6: json['sub_ket6'],
      subket7: json['sub_ket7'],
      subket8: json['sub_ket8'],
      subket9: json['sub_ket9'],
      nilai: json['nilai'],
      satuan: json['satuan'],
      tahun: json['tahun'],
      semester: json['semester'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
    );
  }
}

class DataUrusanPilihan extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Data Urusan Pilihan',style: TextStyle(fontSize: 16.0),),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.search),
            //     onPressed: (){
            //       // showSearch(context: context,delegate: CustomSearchDelegate(fetchData()));
            //     },
            //     ),
            // ],
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('1. Kelautan dan Perikanan'),
                      ),
                      Tab(
                        child: Text('2. Pariwisata'),
                      ),
                      Tab(
                        child: Text('3. Pertanian'),
                      ),
                      Tab(
                        child: Text('4. Kehutanan'),
                      ),
                      Tab(
                        child: Text('5. Energi dan SumberDaya Mineral'),
                      ),
                      Tab(
                        child: Text('6. Perdagangan'),
                      ),
                      Tab(
                        child: Text('7. Perindustrian'),
                      ),
                      Tab(
                        child: Text('8. Transmigrasi'),
                      )
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: Center(
                  child: kelautandanperikanan(),
                ),
              ),
              Container(
                child: Center(
                  child: pariwisata(),
                ),
              ),
              Container(
                child: Center(
                  child: pertanian(),
                ),
              ),
              Container(
                child: Center(
                  child: kehutanan(),
                ),
              ),
              Container(
                child: Center(
                  child: energidansumberdayamineral(),
                ),
              ),
              Container(
                child: Center(
                  child: perdagangan(),
                ),
              ),
              Container(
                child: Center(
                  child: perindustrian(),
                ),
              ),
              Container(
                child: Center(
                  child: transmigrasi(),
                ),
              ),
            ],
          )),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate{
//    final Future<List<Data>> datas;

//   CustomSearchDelegate(this.datas);
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [IconButton(
//       icon: Icon(Icons.clear),
//       onPressed: (){
//         query="";
//       },
//     )];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: (){
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
   
//     return FutureBuilder<List<Data>>(
//             future: datas,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 final hasilsearch = snapshot.data.where((a)=>a.namadata.toLowerCase().contains(query));
//                 // print(data);
//                 return ListView(
//                   children: hasilsearch.map<ListTile>((a)=>ListTile(
//                     title: Text(a.namadata),
//                     subtitle: Text(a.nilai.toDouble().toString()+"  "+a.satuan),
//                   )).toList(),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           );
//   }


// }

// // class SearchList extends StatelessWidget {
// //   final List<Data> datas;
// //   final String querydatas;
// //   Widget savewidget;

// //   SearchList({Key key, this.datas,this.querydatas}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: <Widget>[
// //         Expanded(
// //           child: SizedBox(
// //               height: 500.0,
// //               child: ListView.builder(
// //                 itemCount: datas.length,
// //                 itemBuilder: (BuildContext context, int i) {
// //                   return Column(
// //                     children: <Widget>[
// //                       if(datas[i].namadata == querydatas){
// //                         Text(datas[i].namadata);
// //                       }
// //                     ],
// //                   );
// //                 },
// //               )),
// //         )
// //       ],
// //     );
// //   }
// // }