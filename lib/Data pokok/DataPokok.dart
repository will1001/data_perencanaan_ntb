import 'package:data_perencanaan_ntb/ShowData.dart';
import 'package:flutter/material.dart';




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
      body: showdata("1")
    );
  }
}
