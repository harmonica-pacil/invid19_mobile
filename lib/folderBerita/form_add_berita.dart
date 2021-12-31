import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invid19/folderBerita/home_berita.dart';
import 'widget_popup.dart';
import 'package:invid19/folderBerita/berita.dart';
import 'package:invid19/folderBerita/get_berita.dart';

class FormAddBerita extends StatelessWidget {
  const FormAddBerita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Berita',
              style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: BeritaForm(),
        ));
  }
}

class BeritaForm extends StatefulWidget {
  BeritaForm({Key? key}) : super(key: key);

  @override
  State<BeritaForm> createState() => _BeritaFormState();
}

class _BeritaFormState extends State<BeritaForm> {
  String judulBerita  = "";
  String penulis = "";
  String spoiler = "";
  String isiBerita = "";
  String tanggalRilis = DateTime.now().toString().substring(0, 10);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
            child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
                    
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                hintText: 'Judul Berita',
                labelText: 'Judul Berita',
              ),

              // decoration: InputDecoration(
              //   filled: true,
              //   fillColor: Colors.white,
              //   border: UnderlineInputBorder(),
              //   labelText: 'Judul Berita',
              //   labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 15),
              //   floatingLabelBehavior: FloatingLabelBehavior.auto,
              // ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Judul berita harus ditulis !";
                }
                judulBerita = value!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SizedBox(
              width: 600,
              child: TextFormField(
                cursorColor: Colors.white,
                textAlign: TextAlign.justify,
                maxLines: 15,
                style:
                  TextStyle(fontSize: 15, height: 1.5, color: Colors.white),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.text_snippet_rounded ),
                    hintText: 'Isi Berita',
                    labelText: 'Isi Berita',
                  ),

                // decoration: InputDecoration(
                //   filled: true,
                //   fillColor: Colors.white,
                //   border: UnderlineInputBorder(),
                //   labelText: 'Isi Berita',
                //   labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 15),
                //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                // ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Isi berita tidak boleh kosong";
                  }
                  isiBerita = value!;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SizedBox(
              child: TextFormField(
                cursorColor: Colors.white,
                style:
                    TextStyle(fontSize: 15, height: 1.5, color: Colors.white),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.people_rounded),
                    hintText: 'Penulis',
                    labelText: 'Penulis',
                  ),
                // decoration: InputDecoration(
                //   filled: true,
                //   fillColor: Colors.white,
                //   border: UnderlineInputBorder(),
                //   labelText: 'Penulis',
                //   labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 15),
                //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                // ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Penulis boleh anonim";
                  }
                  penulis = value!;
                },
                // onChanged: (value) => {
                //   setState(
                //     () {
                //       peninjau = value;
                //     },
                //   )
                // },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SizedBox(
              child: TextFormField(
                cursorColor: Colors.white,
                style:
                    TextStyle(fontSize: 15, height: 1.5, color: Colors.white),
                // decoration: InputDecoration(
                //   filled: true,
                //   fillColor: Colors.white,
                //   border: UnderlineInputBorder(),
                //   labelText: 'spoiler',
                //   labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 16),
                //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                // ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.sticky_note_2),
                  hintText: 'spoiler',
                  labelText: 'spoiler',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "spoiler tidak boleh kosong";
                  }
                  spoiler = value!;
                },
                // onChanged: (value) => {
                //   setState(
                //     () {
                //       thumbnail = value;
                //     },
                //   )
                // },
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(100, 30)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.blue.shade200)))),
                    child:
                        const Text('Back', style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(100, 30)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    child: const Text('Tambah', style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Berita beritaBaru = Berita(
                            judulBerita: judulBerita,
                            tanggalRilis: tanggalRilis,
                            penulis: penulis,
                            spoiler: spoiler,
                            isiBerita: isiBerita);
                        addBerita(beritaBaru).then((value) {
                          showDialog(   
                              context: context,
                              builder: (BuildContext context) =>
                                  popupDialog(context));
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => homeBerita()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                warningPopup(context));
                      }
                    },
                  ))
            ],
          )
        ],
      ),
    )));
  }
}
