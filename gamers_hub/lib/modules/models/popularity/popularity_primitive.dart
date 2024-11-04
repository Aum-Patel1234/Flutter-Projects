class PopularityPrimitive {
  final int id;
  final int gameId;
  final int popularityType;
  final int popularitySource;
  final int value;
  final int calculatedAt;
  final int createdAt;
  final int updatedAt;

  PopularityPrimitive({
    required this.id,
    required this.gameId,
    required this.popularityType,
    required this.popularitySource,
    required this.value,
    required this.calculatedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a PopularityPrimitive object from JSON
  factory PopularityPrimitive.fromJson(Map<String, dynamic> json) {
    return PopularityPrimitive(
      id: json['id'] ?? 0,
      gameId: json['game_id'] ?? 0,
      popularityType: json['popularity_type'] ?? 0,
      popularitySource: json['popularity_source'] ?? 0,
      value: json['value'] ?? 0,
      calculatedAt: json['calculated_at'] ?? 0,
      createdAt: json['created_at'] ?? 0,
      updatedAt: json['updated_at'] ?? 0,
    );
  }

  // Method to convert a PopularityPrimitive object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'game_id': gameId,
      'popularity_type': popularityType,
      'popularity_source': popularitySource,
      'value': value,
      'calculated_at': calculatedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}