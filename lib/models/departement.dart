class Department {
  int? id; // Primary key, optional as it will be auto-generated
  int regionId; // Foreign key referencing TD_REGION
  String code;
  String nom;
  String regionCode;

  Department({
    this.id,
    required this.regionId,
    required this.code,
    required this.nom,
    required this.regionCode,
  });

  // Convert a Map (from SQLite) to a TdDepartement object
  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      id: map['Id'] as int?,
      regionId: map['RegionId'] as int,
      code: map['Code'] as String,
      nom: map['Nom'] as String,
      regionCode: map['RegionCode'] as String,
    );
  }

  // Convert a TdDepartement object to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'RegionId': regionId,
      'Code': code,
      'Nom': nom,
      'RegionCode': regionCode,
    };
  }

  // Create a list of TdDepartement objects from a list of maps
  static List<Department> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Department.fromMap(map)).toList();
  }
}
