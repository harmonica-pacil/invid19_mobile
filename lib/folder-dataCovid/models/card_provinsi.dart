class Provinsi {
  late String namaProvinsi;
  late String kasusPositif;
  late String kasusSembuh;
  late String kasusMeninggal;

  Provinsi({
    required this.namaProvinsi,
    required this.kasusPositif,
    required this.kasusSembuh,
    required this.kasusMeninggal,
  });
}

var listProvinsi = [
  Provinsi(
      namaProvinsi: "Jawa Barat",
      kasusPositif: "2.304.156",
      kasusSembuh: "1.097.334",
      kasusMeninggal: "145.982"),
  Provinsi(
      namaProvinsi: "DKI Jakarta",
      kasusPositif: "3.982.765",
      kasusSembuh: "1.982.776",
      kasusMeninggal: "291.652"),
  Provinsi(
      namaProvinsi: "Jawa Tengah",
      kasusPositif: "781.872",
      kasusSembuh: "98.374",
      kasusMeninggal: "98.256")
];
