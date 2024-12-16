class Region {
  int? id; // Primary key, optional as it will be auto-generated
  String code;
  String nom;

  Region({
    this.id,
    required this.code,
    required this.nom,
  });

  // Convert a Map (from SQLite) to a TdRegion object
  factory Region.fromMap(Map<String, dynamic> map) {
    return Region(
      id: map['Id'] as int?,
      code: map['Code'] as String,
      nom: map['Nom'] as String,
    );
  }

  // Convert a TdRegion object to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Code': code,
      'Nom': nom,
    };
  }

  // Create a list of TdRegion objects from a list of maps
  static List<Region> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Region.fromMap(map)).toList();
  }
}
