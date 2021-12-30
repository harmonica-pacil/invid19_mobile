class Vaksin {
  late String kode;
  late String kota;
  late String provinsi;
  late String lokasi;
  late String jenis_vaksin;
  late String tanggal;
  late String jam_mulai;
  late String jam_berakhir;
  late int kuota;

  Vaksin({
    required this.kode,
    required this.kota,
    required this.provinsi,
    required this.lokasi,
    required this.jenis_vaksin,
    required this.tanggal,
    required this.jam_mulai,
    required this.jam_berakhir,
    required this.kuota,
  });

  factory Vaksin.fromJson(Map<String, dynamic> json) => Vaksin(
        kode: json["fields"]["kode"],
        kota: json["fields"]["kota"],
        provinsi: json["fields"]["provinsi"],
        lokasi: json["fields"]["lokasi"],
        jenis_vaksin: json["fields"]["jenis_vaksin"],
        tanggal: json["fields"]["tanggal"],
        jam_mulai: json["fields"]["jam_mulai"],
        jam_berakhir: json["fields"]["jam_berakhir"],
        kuota: json["fields"]["kuota"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "kota": kota,
        "provinsi": provinsi,
        "lokasi": lokasi,
        "jenis_vaksin": jenis_vaksin,
        "tanggal": tanggal,
        "jam_mulai": jam_mulai,
        "jam_berakhir": jam_berakhir,
        "kuota": kuota,
      };
}