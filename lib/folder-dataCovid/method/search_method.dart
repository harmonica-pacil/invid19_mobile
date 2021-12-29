import 'package:invid19/folder-dataCovid/models/card_provinsi.dart';

Provinsi search(String namaProvinsi) {
  for (int i = 0; i < listProvinsi.length; i++) {
    if (namaProvinsi.toLowerCase() ==
        listProvinsi[i].namaProvinsi.toLowerCase()) {
      return listProvinsi[i];
    }
  }
  return null as Provinsi;
}
