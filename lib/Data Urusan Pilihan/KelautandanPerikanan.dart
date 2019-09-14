import 'dart:async';
import 'dart:convert';
import 'package:data_perencanaan_ntb/model/SemesterFilter.dart';
import 'package:data_perencanaan_ntb/model/TahunFilter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

Future<List<Data>> fetchData() async {
  String url = "http://www.json-generator.com/api/json/get/cqHsCSTlrC?indent=2";
  final response = await http.get(url);
  // print(response.body);

  return compute(parseDatas, response.body);
}

class Data {
  final int id;
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
  final double nilai;
  final String satuan;
  final String tahun;
  final String createdat;
  final String updatedat;

  Data({
    this.id,
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
    this.createdat,
    this.updatedat,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
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
      nilai: json['nilai'].toDouble(),
      satuan: json['satuan'],
      tahun: json['tahun'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
    );
  }
}

List<Data> parseDatas(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();
}

Widget kelautandanperikanan() {
  return ListView(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1,color: Colors.black)
          )
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Text('Tahun :'),
            ),
            ChangeNotifierProvider<TahunFilter>(
              builder: (context) => TahunFilter(),
              child: Consumer<TahunFilter>(
                builder: (context, tahunfilter, _) => DropdownButton<String>(
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
                    tahunfilter.dropdownValue = newValue;
                  },
                  items: tahunfilter.listtahun
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:21.0),
              child: Text('Semester :'),
            ),
            ChangeNotifierProvider<SemesterFilter>(
             builder: (context) => SemesterFilter(),
              child: Consumer<SemesterFilter>(
                builder: (context, semesterfilter, _) => Row(
                  children: <Widget>[
                    Text('1'),
                    Radio(
                            value: 1,
                            groupValue: semesterfilter.semester, 
                            onChanged: (int value) {
                           semesterfilter.semester=value;
                            },
                          ),
                    Text('2'),
                          Radio(
                            value: 2,
                            groupValue: semesterfilter.semester, 
                            onChanged: (int value) {
                           semesterfilter.semester=value;
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Center(
        child: FutureBuilder<List<Data>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return InfosList(datas: data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      )
    ],
  );
}

class InfosList extends StatelessWidget {
  final List<Data> datas;
  String temp = "random";
  List<String> subket1list = [];
  Widget savewidget;

  InfosList({Key key, this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
              height: 500.0,
              child: ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int i) {
                  if (datas[i].subket1 == null)
                    return ListTile(
                      title: Text(datas[i].namadata),
                      subtitle: Text((datas[i].nilai.toString().substring(
                                  datas[i].nilai.toString().length - 1) ==
                              "0")
                          ? datas[i].nilai.toInt().toString() +
                              " " +
                              (datas[i].satuan == null ? "" : datas[i].satuan)
                          : datas[i].nilai.toString() +
                              " " +
                              (datas[i].satuan == null ? "" : datas[i].satuan)),
                      trailing: Text(datas[i].tahun.toString().substring(0, 4)),
                    );
                  if (datas[i].subket1 != temp) {
                    subket1list.add(datas[i].subket1);
                    savewidget = ExpansionTile(
                      title: Text(datas[i].subket1),
                      children: _subket2(datas, datas[i].subket1),
                    );
                    temp = datas[i].subket1;
                  } else {
                    savewidget = Container();
                  }
                  return savewidget;
                },
              )),
        )
      ],
    );
  }
}

List<Widget> _subket2(List<Data> datas, String subket1list) {
  List<Widget> savewidget = [];
  String temp = "random";

  List<Data>.generate(datas.length, (int i) {
    if (datas[i].subket2 == null && datas[i].subket1 == subket1list) {
      savewidget.add(ListTile(
        title: Text(datas[i].namadata),
        subtitle: Text((datas[i]
                    .nilai
                    .toString()
                    .substring(datas[i].nilai.toString().length - 1) ==
                "0")
            ? datas[i].nilai.toInt().toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)
            : datas[i].nilai.toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)),
        trailing: Text(datas[i].tahun.toString().substring(0, 4)),
      ));
    } else {
      savewidget.add(Container());
    }

    if (datas[i].subket2 != null && datas[i].subket1 == subket1list) {
      if (datas[i].subket2 != temp) {
        savewidget.add(ExpansionTile(
          title: Text(datas[i].subket2),
          children: _subket3(datas, subket1list, datas[i].subket2),
        ));
        temp = datas[i].subket2;
      } else {
        savewidget.add(Container());
      }
    } else {
      savewidget.add(Container());
    }
  });

  return savewidget;
}

List<Widget> _subket3(
    List<Data> datas, String subket1list, String subket2list) {
  List<Widget> savewidget = [];
  String temp = "random";

  List<Data>.generate(datas.length, (int i) {
    if (datas[i].subket3 == null &&
        datas[i].subket2 == subket2list &&
        datas[i].subket1 == subket1list) {
      savewidget.add(ListTile(
        title: Text(datas[i].namadata),
        subtitle: Text((datas[i]
                    .nilai
                    .toString()
                    .substring(datas[i].nilai.toString().length - 1) ==
                "0")
            ? datas[i].nilai.toInt().toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)
            : datas[i].nilai.toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)),
        trailing: Text(datas[i].tahun.toString().substring(0, 4)),
      ));
    } else {
      savewidget.add(Container());
    }

    if (datas[i].subket3 != null &&
        datas[i].subket2 == subket2list &&
        datas[i].subket1 == subket1list) {
      if (datas[i].subket3 != temp) {
        savewidget.add(ExpansionTile(
          title: Text(datas[i].subket3),
          children: _subket4(datas, subket1list, subket2list, datas[i].subket3),
        ));
        temp = datas[i].subket3;
      } else {
        savewidget.add(Container());
      }
    } else {
      savewidget.add(Container());
    }
  });

  return savewidget;
}

List<Widget> _subket4(List<Data> datas, String subket1list, String subket2list,
    String subket3list) {
  List<Widget> savewidget = [];
  String temp = "random";

  List<Data>.generate(datas.length, (int i) {
    if (datas[i].subket4 == null &&
        datas[i].subket3 == subket3list &&
        datas[i].subket2 == subket2list &&
        datas[i].subket1 == subket1list) {
      savewidget.add(ListTile(
        title: Text(datas[i].namadata),
        subtitle: Text((datas[i]
                    .nilai
                    .toString()
                    .substring(datas[i].nilai.toString().length - 1) ==
                "0")
            ? datas[i].nilai.toInt().toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)
            : datas[i].nilai.toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)),
        trailing: Text(datas[i].tahun.toString().substring(0, 4)),
      ));
    } else {
      savewidget.add(Container());
    }

    if (datas[i].subket4 != null &&
        datas[i].subket3 == subket3list &&
        datas[i].subket2 == subket2list &&
        datas[i].subket1 == subket1list) {
      if (datas[i].subket4 != temp) {
        savewidget.add(ExpansionTile(
          title: Text(datas[i].subket4),
          children: _subket5(
              datas, subket1list, subket2list, subket3list, datas[i].subket4),
        ));
        temp = datas[i].subket4;
      } else {
        savewidget.add(Container());
      }
    } else {
      savewidget.add(Container());
    }
  });

  return savewidget;
}

List<Widget> _subket5(List<Data> datas, String subket1list, String subket2list,
    String subket3list, String subket4list) {
  List<Widget> savewidget = [];
  String temp = "random";

  List<Data>.generate(datas.length, (int i) {
    if (datas[i].subket5 == null &&
        datas[i].subket4 == subket4list &&
        datas[i].subket3 == subket3list &&
        datas[i].subket2 == subket2list &&
        datas[i].subket1 == subket1list) {
      savewidget.add(ListTile(
        title: Text(datas[i].namadata),
        subtitle: Text((datas[i]
                    .nilai
                    .toString()
                    .substring(datas[i].nilai.toString().length - 1) ==
                "0")
            ? datas[i].nilai.toInt().toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)
            : datas[i].nilai.toString() +
                " " +
                (datas[i].satuan == null ? "" : datas[i].satuan)),
        trailing: Text(datas[i].tahun.toString().substring(0, 4)),
      ));
    } else {
      savewidget.add(Container());
    }

    if (datas[i].subket4 != null &&
        datas[i].subket4 == subket4list &&
        datas[i].subket3 == subket3list &&
        datas[i].subket2 == subket2list &&
        datas[i].subket1 == subket1list) {
      if (datas[i].subket4 != temp) {
        savewidget.add(ExpansionTile(
          title: Text(datas[i].subket4),
          children: <Widget>[],
        ));
        temp = datas[i].subket4;
      } else {
        savewidget.add(Container());
      }
    } else {
      savewidget.add(Container());
    }
  });

  return savewidget;
}
