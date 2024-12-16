class District {
  int? id; // Primary key, optional since it is auto-incremented
  int communeId; // Foreign key referencing TD_COMMUNE
  String code;
  String nom;
  String communeCode;

  District({
    this.id,
    required this.communeId,
    required this.code,
    required this.nom,
    required this.communeCode,
  });

  // Convert a Map (from SQLite) to a TdQuartier object
  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['Id'] as int?,
      communeId: map['CommuneId'] as int,
      code: map['Code'] as String,
      nom: map['Nom'] as String,
      communeCode: map['CommuneCode'] as String,
    );
  }

  // Convert a TdQuartier object to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'CommuneId': communeId,
      'Code': code,
      'Nom': nom,
      'CommuneCode': communeCode,
    };
  }

  // Create a list of TdQuartier objects from a list of maps
  static List<District> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => District.fromMap(map)).toList();
  }
}
