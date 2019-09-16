import 'package:flutter/material.dart';

import '../ShowData.dart';

void main() {
  runApp(DataUrusanPilihan());
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
                  child: showdata("2"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("3"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("4"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("5"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("6"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("7"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("8"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("9"),
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