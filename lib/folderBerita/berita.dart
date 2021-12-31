class Berita {
  final String judulBerita;
  final String tanggalRilis;
  final String penulis;
  final String spoiler;
  final String isiBerita;

  const Berita(
      {required this.judulBerita,
      required this.tanggalRilis,
      required this.penulis,
      required this.spoiler,
      required this.isiBerita
  });

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        judulBerita: json["fields"]["judulBerita"],
        tanggalRilis: json["fields"]["tanggalRilis"],
        penulis: json["fields"]["penulis"],
        spoiler: json["fields"]["spoiler"],
        isiBerita: json["fields"]["isiBerita"],
      );

  Map<String, dynamic> toJson() => {
        "judulBerita": judulBerita,
        "tanggalRilis": tanggalRilis,
        "penulis": penulis,
        "spoiler": spoiler,
        "isiBerita": isiBerita,
      };
}
