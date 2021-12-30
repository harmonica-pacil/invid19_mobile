import 'package:flutter/material.dart';
import '../models/pendaftar.dart';
import '../screens/home_vaksinasi.dart';
import '../methods/vaksinasi_method.dart';

class AddPendaftar extends StatefulWidget {
  final String koma;
  const AddPendaftar(this.koma);
  @override
  _AddPendaftar createState() => _AddPendaftar();
}

class _AddPendaftar extends State<AddPendaftar> {
  late String kode;
  late String NIK;
  late String nama_lengkap;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Form Pendaftar",
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
                      initialValue: widget.koma,
                      decoration: InputDecoration(
                        
                        labelText: "Kode Vaksinasi",
                        
                        icon: const Icon(Icons.school),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Kode Vaksinasi tidak boleh kosong');
                          return 'Kode Vaksinasi tidak boleh kosong';
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
                        hintText: "16 digit",
                        labelText: "NIK",
                        icon: const Icon(Icons.domain_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('NIK tidak boleh kosong');
                          return 'NIK tidak boleh kosong';
                        }
                        NIK = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama Lengkap",
                        icon: const Icon(Icons.people),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Nama Lengkap tidak boleh kosong');
                          return 'Nama Lengkap tidak boleh kosong';
                        }
                        nama_lengkap = value;
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
                          Pendaftar pendaftar = Pendaftar(
                            kode: kode,
                            NIK: NIK,
                            nama_lengkap: nama_lengkap,
                          );
                          addPendaftar(pendaftar).then((value) {
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