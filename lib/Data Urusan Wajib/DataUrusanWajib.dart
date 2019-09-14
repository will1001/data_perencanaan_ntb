import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/AdministrasiKependudukandanPencatatanSipil.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/KeamanandanKetertibanUmum.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Kearsipan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Kebudayaan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/KepemudaandanOlahraga.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Kesehatan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/KomunikasidanInformatika.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/KoperasiUsahaKecildanMenengah.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/LingkunganHidup.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Pangan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/PekerjaanUmumdanPenataanRuang.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/PemberdayaanMasyarakatDesa.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/PemberdayaanPerempuandanPerlindunganAnak.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/PenanamanModal.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Pendidikan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/PendudukdanKeluargaBerencana.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Perhubungan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Perpustakaan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Pertanahan.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/PerumahandanKawasanPermukiman.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/Sosial.dart';
import 'package:data_perencanaan_ntb/Data%20Urusan%20Wajib/TenagaKerja.dart';
import 'package:flutter/material.dart';

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
                  child: pendidikan(),
                ),
              ),
              Container(
                child: Center(
                  child: kesehatan(),
                ),
              ),
              Container(
                child: Center(
                  child: pekerjaanumumdanpenataanruang(),
                ),
              ),
              Container(
                child: Center(
                  child: perumahandankawasanpermukiman(),
                ),
              ),
              Container(
                child: Center(
                  child: keamanandanketertibanumum(),
                ),
              ),
              Container(
                child: Center(
                  child: sosial(),
                ),
              ),
              Container(
                child: Center(
                  child: tenagakerja(),
                ),
              ),
              Container(
                child: Center(
                  child: pemberdayaanperempuandanperlindunganAnak(),
                ),
              ),
              Container(
                child: Center(
                  child: pangan(),
                ),
              ),
              Container(
                child: Center(
                  child: pertanahan(),
                ),
              ),
              Container(
                child: Center(
                  child: lingkunganhidup(),
                ),
              ),
              Container(
                child: Center(
                  child: administrasikependudukandanpencatatansipil(),
                ),
              ),
              Container(
                child: Center(
                  child: pemberdayaanmasyarakatdesa(),
                ),
              ),
              Container(
                child: Center(
                  child: pendudukdankeluargaberencana(),
                ),
              ),
              Container(
                child: Center(
                  child: perhubungan(),
                ),
              ),
              Container(
                child: Center(
                  child: komunikasidaninformatika(),
                ),
              ),
              Container(
                child: Center(
                  child: koperasiusahakecildanmenengah(),
                ),
              ),
              Container(
                child: Center(
                  child: penanamanmodal(),
                ),
              ),
              Container(
                child: Center(
                  child: kepemudaandanolahraga(),
                ),
              ),
              Container(
                child: Center(
                  child: kebudayaan(),
                ),
              ),
              Container(
                child: Center(
                  child: perpustakaan(),
                ),
              ),
              Container(
                child: Center(
                  child: kearsipan(),
                ),
              ),
            ],
          )),
    );
  }
}