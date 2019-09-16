import 'package:data_perencanaan_ntb/model/SemesterFilter.dart';
import 'package:data_perencanaan_ntb/model/TahunFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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


class DataPokok extends StatefulWidget {
DataPokok({this.title});
final String title;
  @override
  _DataPokokState createState() => _DataPokokState();
}

class _DataPokokState extends State<DataPokok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Data Pokok',style: TextStyle(fontSize: 16.0),),
      ),
      body: MultiProvider(
    providers: [
      ChangeNotifierProvider<TahunFilter>(
        builder: (context) => TahunFilter(),
      ),
      ChangeNotifierProvider<SemesterFilter>(
        builder: (context) => SemesterFilter(),
      ),
    ],
    child: Consumer<TahunFilter>(
      builder: (context, tahunfilter, _) => ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text('Tahun :'),
                ),
                DropdownButton<String>(
                  value: tahunfilter.dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) {
                    tahunfilter.dropdownValue = newValue.toString();
                  },
                  items: tahunfilter.listtahun
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 71.0),
                  child: Text('Semester :'),
                ),
                Consumer<SemesterFilter>(
                  builder: (context, semesterfilter, _) => Row(
                    children: <Widget>[
                      Text('1'),
                      Radio(
                        value: 1,
                        groupValue: semesterfilter.semester,
                        onChanged: (int value) {
                          semesterfilter.semester = value;
                        },
                      ),
                      Text('2'),
                      Radio(
                        value: 2,
                        groupValue: semesterfilter.semester,
                        onChanged: (int value) {
                          semesterfilter.semester = value;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Consumer<SemesterFilter>(
                  builder: (context, semesterfilter, _) => Center(
              child: FutureBuilder<List<Data>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var semestertemp=semesterfilter.semester==1?"Ganjil":"Genap";
                    var data = snapshot.data
                        .where((a) =>
                            a.tahun.substring(0, 4) ==
                            tahunfilter.dropdownValue)
                        .toList();
                        data = data
                        .where((a) =>
                            a.idkategori == "1"
                            )
                        .toList();
                        data = data
                        .where((a) =>
                            a.semester == semestertemp
                            )
                        .toList();
                    return InfosList(datas: data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          )
        ],
      ),
    ),
  )
    );
  }
}

class InfosList extends StatelessWidget {
  final List<Data> datas;

  InfosList({Key key, this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
              height: 500.0,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        datas[i].subket1 == null
                            ? Container()
                            : Text(
                                datas[i].subket1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                        datas[i].subket2 == null
                            ? Container()
                            : Text(
                                datas[i].subket2,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                        datas[i].subket3 == null
                            ? Container()
                            : Text(
                                datas[i].subket3,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                        datas[i].subket4 == null
                            ? Container()
                            : Text(
                                datas[i].subket4,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                        datas[i].subket5 == null
                            ? Container()
                            : Text(
                                datas[i].subket5,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                      ],
                    ),
                    subtitle: Text(
                      datas[i].namadata,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        datas[i].nilai == null
                            ? Container()
                            : Text(datas[i].nilai),
                        datas[i].satuan == null
                            ? Text('')
                            : Text(datas[i].satuan),
                      ],
                    ),
                  );
                },
              )),
        )
      ],
    );
  }
}
