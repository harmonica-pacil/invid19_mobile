import 'dart:math';

import 'package:flutter/material.dart';

import '../models/vaksin.dart';
import '../screens/home_vaksinasi.dart';
import '../methods/vaksinasi_method.dart';

class AddVaksinasi extends StatefulWidget {
  @override
  _AddVaksinasi createState() => _AddVaksinasi();
}

class _AddVaksinasi extends State<AddVaksinasi> {

  late String kode;
  late String kota;
  late String provinsi;
  late String lokasi;
  late String jenis_vaksin;
  late String tanggal;
  late String jam_mulai;
  late String jam_berakhir;
  late int kuota;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Form Vaksinasi",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Char 3 digit",
                        labelText: "Kode",
                        icon: const Icon(Icons.school),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Kode tidak boleh kosong';
                        }
                        kode = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Provinsi",
                        icon: const Icon(Icons.domain_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Provinsi tidak boleh kosong');
                          return 'Provinsi tidak boleh kosong';
                        }
                        provinsi = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Kota",
                        icon: const Icon(Icons.social_distance_outlined ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Kota tidak boleh kosong');
                          return 'Kota tidak boleh kosong';
                        }
                        kota = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Lokasi",
                        icon: const Icon(Icons.splitscreen_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Lokasi tidak boleh kosong');
                          return 'Lokasi tidak boleh kosong';
                        }
                        lokasi = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Jenis Vaksin",
                        icon: const Icon(Icons.sort_outlined ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Jenis vaksin tidak boleh kosong');
                          return 'Jenis vaksin tidak boleh kosong';
                        }
                        jenis_vaksin = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Tanggal",
                        icon: const Icon(Icons.sort_outlined ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Tanggal tidak boleh kosong');
                          return 'Tanggal tidak boleh kosong';
                        }
                        tanggal = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Jam mulai",
                        icon: const Icon(Icons.lock_clock_outlined ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Jam mulai tidak boleh kosong');
                          return 'Jam mulai tidak boleh kosong';
                        }
                        jam_mulai = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Jam Berakhir",
                        icon: const Icon(Icons.lock_clock_outlined ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Jam berakhir tidak boleh kosong');
                          return 'Jam berakhir tidak boleh kosong';
                        }
                        jam_berakhir = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Kuota",
                        icon: const Icon(Icons.segment_outlined ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Kuota tidak boleh kosong');
                          return 'Kuota tidak boleh kosong';
                        }
                        kuota = int.parse(value);
                        return null;
                      },
                    ),
                  ),
                  RaisedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                        
                      ),
                      color: Colors.indigo.shade500,
                      onPressed: () {
                        print("Button Clicked");
                        _formKey.currentState!.validate();
                        if (_formKey.currentState?.validate() ?? false) {
                          Vaksin vaksin = Vaksin(
                            kode: kode,
                            kota: kota,
                            provinsi: provinsi,
                            lokasi: lokasi,
                            jenis_vaksin: jenis_vaksin,
                            tanggal: tanggal,
                            jam_mulai: jam_mulai,
                            jam_berakhir: jam_berakhir,
                            kuota: kuota,
                          );
                          addVaksin(vaksin).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  value,
                                ),
                              ),
                            );
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return  HomeVaksinasi();
                          }));
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}