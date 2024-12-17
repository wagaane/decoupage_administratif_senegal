class City {
  int? id; // Primary key, optional as it will be auto-incremented
  int departementId; // Foreign key referencing TD_DEPARTEMENT
  String code;
  String nom;
  String departementCode;

  City({
    this.id,
    required this.departementId,
    required this.code,
    required this.nom,
    required this.departementCode,
  });

  // Convert a Map (from SQLite) to a TdVille object
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['Id'] as int?,
      departementId: map['DepartementId'] as int,
      code: map['Code'] as String,
      nom: map['Nom'] as String,
      departementCode: map['DepartementCode'] as String,
    );
  }

  // Convert a TdVille object to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'DepartementId': departementId,
      'Code': code,
      'Nom': nom,
      'DepartementCode': departementCode,
    };
  }

  // Create a list of TdVille objects from a list of maps
  static List<City> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => City.fromMap(map)).toList();
  }
}
