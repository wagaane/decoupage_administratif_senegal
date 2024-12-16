class Commune {
  int? id; // Primary key, optional since it is auto-incremented
  int villeId; // Foreign key referencing TD_VILLE
  String code;
  String nom;
  String villeCode;

  Commune({
    this.id,
    required this.villeId,
    required this.code,
    required this.nom,
    required this.villeCode,
  });

  // Convert a Map (from SQLite) to a TdCommune object
  factory Commune.fromMap(Map<String, dynamic> map) {
    return Commune(
      id: map['Id'] as int?,
      villeId: map['VilleId'] as int,
      code: map['Code'] as String,
      nom: map['Nom'] as String,
      villeCode: map['VilleCode'] as String,
    );
  }

  // Convert a TdCommune object to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'VilleId': villeId,
      'Code': code,
      'Nom': nom,
      'VilleCode': villeCode,
    };
  }

  // Create a list of TdCommune objects from a list of maps
  static List<Commune> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Commune.fromMap(map)).toList();
  }
}
