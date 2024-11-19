class FavoriteModel {
  final int? id;
  final String strTeam;
  final String strBadge;
  final String strStadium;
  final String strDescriptionEN;
  final bool isCompleted;

  FavoriteModel({
    this.id,
    required this.strTeam,
    required this.strBadge,
    required this.strStadium,
    required this.strDescriptionEN,
    required this.isCompleted,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      strTeam: map['strTeam'],
      strBadge: map['strBadge'],
      strStadium: map['strStadium'],
      strDescriptionEN: map['strDescriptionEN'],
      isCompleted: map['isCompleted'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'strTeam': strTeam,
      'strBadge': strBadge,
      'strStadium': strStadium,
      'strDescriptionEN': strDescriptionEN,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
