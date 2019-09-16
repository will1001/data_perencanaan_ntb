import 'package:data_perencanaan_ntb/Data%20Urusan%20Pilihan/DataUrusanPilihan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/DataUrusanWajib.dart';
import 'package:data_perencanaan_ntb/Data%20pokok/DataPokok.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
Home({this.title});
final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Opacity(opacity: 0.0,child: Icon(Icons.ac_unit)),
        centerTitle: true,
            title: Text(widget.title,style: TextStyle(fontSize: 16.0),),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                  leading: Icon(Icons.archive,size: 65.0,color: Colors.blue,),
                  title: Text('Data Pokok'),
                  onTap: (){
                   Navigator.of(context)
                   .push(MaterialPageRoute(builder: (c) => DataPokok()));
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.blue,width: 1.0),
                  right: BorderSide(color: Colors.blue,width: 1.0),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                  leading: Icon(Icons.archive,size: 65.0,color: Colors.blue,),
                  title: Text('Data Urusan Pilihan'),
                  onTap: (){
                    Navigator.of(context)
                   .push(MaterialPageRoute(builder: (c) => DataUrusanPilihan()));
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                  leading: Icon(Icons.archive,size: 65.0,color: Colors.blue,),
                  title: Text('Data Urusan Wajib'),
                  onTap: (){
                   Navigator.of(context)
                   .push(MaterialPageRoute(builder: (c) => DataUrusanWajib()));
                  },
                ),
              ),
            ),
            
          ],
        )
      ),
    );
  }
}