import 'package:data_perencanaan_ntb/model/SemesterFilter.dart';
import 'package:data_perencanaan_ntb/model/TahunFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataUrusanPilihan.dart';

Widget perindustrian(){
  return MultiProvider(
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
                          a.idkategori == "8"
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
  );
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