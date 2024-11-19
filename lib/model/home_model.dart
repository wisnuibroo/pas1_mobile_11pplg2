class HomeModel {
  final String id;
  final String name;
  final String badge;
  final String stadium;
  final String deskripsi;

  HomeModel({
    required this.id,
    required this.name,
    required this.badge,
    required this.stadium,
    required this.deskripsi,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['idTeam'] ?? 'Tidak ada kategori',
      name: json['strTeam'] ?? 'Tidak ada kategori',
      badge: json['strBadge'] ?? '',
      stadium: json['strStadium'] ?? 'Tidak ada kategori',
      deskripsi: json['strDescriptionEN'] ?? 'Tidak ada deskripsi',
    );
  }
}
