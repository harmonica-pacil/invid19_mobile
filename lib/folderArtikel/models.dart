class Article {
  final String judul;
  final String deskripsi;
  final String tanggal;
  final String images;
  final String peninjau;

  const Article(
      {required this.judul,
      required this.deskripsi,
      required this.tanggal,
      required this.images,
      required this.peninjau});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        judul: json["fields"]["judulArtikel"],
        tanggal: json["fields"]["tglRilis"],
        peninjau: json["fields"]["peninjau"],
        deskripsi: json["fields"]["isiArtikel"],
        images: json["fields"]["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "judulArtikel": judul,
        "tglRilis": tanggal,
        "peninjau": peninjau,
        "isiArtikel": deskripsi,
        "thumbnail": images,
      };
}
