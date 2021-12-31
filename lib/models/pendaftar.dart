class Pendaftar {
  late String kode;
  late String NIK;
  late String nama_lengkap;

  Pendaftar({
    required this.kode,
    required this.NIK,
    required this.nama_lengkap,
  });

  factory Pendaftar.fromJson(Map<String, dynamic> json) => Pendaftar(
        kode: json["fields"]["kode"],
        NIK: json["fields"]["NIK"],
        nama_lengkap: json["fields"]["nama_lengkap"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "NIK": NIK,
        "nama_lengkap": nama_lengkap,
      };
}