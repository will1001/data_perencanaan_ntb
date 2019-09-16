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
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(DataUrusanWajib());
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