import 'package:flutter/material.dart';
import 'package:invid19/folder-dataCovid/method/search_method.dart';
import 'package:invid19/folder-dataCovid/widgets/card.dart';
import 'package:invid19/folder-dataCovid/widgets/cardMeninggal.dart';
import 'package:invid19/folder-dataCovid/widgets/cardSembuh.dart';
import 'package:invid19/folder-dataCovid/widgets/carousel.dart';
import 'package:invid19/folder-dataCovid/widgets/krisanForm.dart';
import 'package:invid19/folder-dataCovid/widgets/searchForm.dart';

class HomeIsYou extends StatefulWidget {
  const HomeIsYou({Key? key}) : super(key: key);

  @override
  _HomeIsYouState createState() => _HomeIsYouState();
}

class _HomeIsYouState extends State<HomeIsYou> {
  late var hasilSearch;
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  bool doneSearch = false;
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue = "";
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DataCovidCarousel(),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text("Kasus Covid-19 di Indonesia",
              style: TextStyle(fontSize: 30), textAlign: TextAlign.center)),
      CardCovidPositf(),
      CardCovidSembuh(),
      CardCovidMeninggal(),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text("Kasus Covid-19 di Tiap Provinsi",
              style: TextStyle(fontSize: 30), textAlign: TextAlign.center)),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: fieldText,
                decoration: InputDecoration(
                    hintText: "Silakan cari provinsi.",
                    contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required Field';
                  }
                  textFieldsValue = value;
                  return null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                  side: BorderSide(width: 2, color: Colors.indigo),
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      hasilSearch = search(textFieldsValue);
                      doneSearch = true;
                      clearText();
                    });
                  }
                },
                child: const Text('Cari', style: TextStyle(fontSize: 14)),
              ),
              SizedBox(
                height: 20,
              ),
              doneSearch ? buildSearchProvinsi(context, hasilSearch) : Text(""),
            ],
          ),
        ),
      ),
      KrisanForm(),
    ]);
  }
}
