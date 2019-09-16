import 'package:flutter/material.dart';

import '../ShowData.dart';

void main() {
  runApp(DataUrusanWajib());
}




class DataUrusanWajib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 22,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Data Urusan Wajib',style: TextStyle(fontSize: 16.0),),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('1. Pendidikan'),
                      ),
                      Tab(
                        child: Text('2. Kesehatan'),
                      ),
                      Tab(
                        child: Text('3. Pekerjaan Umum dan Penataan Ruang'),
                      ),
                      Tab(
                        child: Text('4. Perumahan dan Kawasan Permukiman'),
                      ),
                      Tab(
                        child: Text('5. Keamanan dan Ketertiban Umum'),
                      ),
                      Tab(
                        child: Text('6. Sosial'),
                      ),
                      Tab(
                        child: Text('7. Tenaga Kerja'),
                      ),
                      Tab(
                        child: Text('8. Pemberdayaan Perempuan dan Perlindungan Anak'),
                      ),
                      Tab(
                        child: Text('9. Pangan'),
                      ),
                      Tab(
                        child: Text('10. Pertanahan'),
                      ),
                      Tab(
                        child: Text('11. Lingkungan Hidup'),
                      ),
                      Tab(
                        child: Text('12. Administrasi Kependudukan dan Pencatatan Sipil'),
                      ),
                      Tab(
                        child: Text('13. Pemberdayaan Masyarakat Desa'),
                      ),
                      Tab(
                        child: Text('14. Pengendalian Penduduk dan Keluarga Berencana'),
                      ),
                      Tab(
                        child: Text('15. Perhubungan'),
                      ),
                      Tab(
                        child: Text('16. Komunikasi dan Informatika'),
                      ),
                      Tab(
                        child: Text('17. Koperasi Usaha Kecil dan Menengah'),
                      ),
                      Tab(
                        child: Text('18. Penanaman Modal'),
                      ),
                      Tab(
                        child: Text('19. Kepemudaan dan Olahraga'),
                      ),
                      Tab(
                        child: Text('20. Kebudayaan'),
                      ),
                      Tab(
                        child: Text('21. Perpustakaan'),
                      ),
                      Tab(
                        child: Text('22. Kearsipan'),
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: Center(
                  child: showdata("10"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("11"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("12"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("13"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("14"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("15"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("16"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("17"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("18"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("19"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("20"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("21"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("22"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("23"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("24"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("25"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("26"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("27"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("28"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("29"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("30"),
                ),
              ),
              Container(
                child: Center(
                  child: showdata("31"),
                ),
              ),
            ],
          )),
    );
  }
}