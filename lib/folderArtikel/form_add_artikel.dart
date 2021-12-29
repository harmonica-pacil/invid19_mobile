import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invid19/folderArtikel/home_artikel.dart';
import 'widget_popup.dart';
import 'models.dart';
import 'package:invid19/folderArtikel/Method/add_data_artikel.dart';

class FormAddArticle extends StatelessWidget {
  const FormAddArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Artikel',
              style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: ArticleForm(),
        ));
  }
}

class ArticleForm extends StatefulWidget {
  ArticleForm({Key? key}) : super(key: key);

  @override
  State<ArticleForm> createState() => _ArticleFormState();
}

class _ArticleFormState extends State<ArticleForm> {
  String judul = "";
  String peninjau = "";
  String deskripsi = "";
  String thumbnail = "";
  String tanggal = DateTime.now().toString().substring(0, 10);

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
              cursorColor: Colors.black54,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: UnderlineInputBorder(),
                labelText: 'Judul Artikel',
                labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 15),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Judul artikel tidak boleh kosong";
                }
                judul = value!;
              },
              // onChanged: (value) => {
              //   setState(
              //     () {
              //       judul = value;
              //     },
              //   )
              // },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SizedBox(
              width: 600,
              child: TextFormField(
                cursorColor: Colors.black54,
                textAlign: TextAlign.justify,
                maxLines: 15,
                style:
                    TextStyle(fontSize: 15, height: 1.5, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  labelText: 'Isi Artikel',
                  labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Isi artikel tidak boleh kosong";
                  }
                  deskripsi = value!;
                },
                // onChanged: (value) => {
                //   setState(
                //     () {
                //       deskripsi = value;
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
                cursorColor: Colors.black54,
                style:
                    TextStyle(fontSize: 15, height: 1.5, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  labelText: 'Peninjau Artikel',
                  labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Peninjau artikel tidak boleh kosong";
                  }
                  peninjau = value!;
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
                cursorColor: Colors.black54,
                style:
                    TextStyle(fontSize: 15, height: 1.5, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(),
                  labelText: 'Thumbnail',
                  labelStyle: TextStyle(color: Color(0xff797C7B), fontSize: 16),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "URL thumbnail artikel tidak boleh kosong";
                  }
                  thumbnail = value!;
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
                        const Text('Kembali', style: TextStyle(fontSize: 16)),
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
                        Article artikelBaru = Article(
                            judul: judul,
                            deskripsi: deskripsi,
                            tanggal: tanggal,
                            images: thumbnail,
                            peninjau: peninjau);
                        addArticle(artikelBaru).then((value) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  popupDialog(context));
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Artikel()));
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
