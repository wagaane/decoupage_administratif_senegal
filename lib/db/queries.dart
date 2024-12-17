import 'package:decoupage_administratif_senegal/models/department.dart';
import 'package:decoupage_administratif_senegal/models/enumerations/TableEnum.dart';
import 'package:decoupage_administratif_senegal/models/enumerations/reponse_status.dart';
import 'package:decoupage_administratif_senegal/models/response.dart';
import 'package:decoupage_administratif_senegal/models/district.dart';
import 'package:decoupage_administratif_senegal/models/city.dart';
import '../models/commune.dart';
import '../models/region.dart';
import 'db_helper.dart';

class Queries {
  // Get the list of  regions
  static Future<Response> getRegions() async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_REGION.name);
    return Response(status: ResponseStatus.OK.name, message: "Liste des régions", data: Region.fromList(res));
  }

  // search regions by name
  static Future<Response> searchRegionsByName(String name) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_REGION.name, where: 'nom LIKE ?', whereArgs: ["%$name%"]);
    return Response(status: ResponseStatus.OK.name, message: "Liste des régions", data: Region.fromList(res));
  }

  // get region by id
  static Future<Response> getRegionById(int id) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_REGION.name, where: "id = ?", whereArgs: [id]);
    if(res.isEmpty) {
      return Response(status: ResponseStatus.EXCEPTION.name, message: "Région avec id $id n'existe pas.");
    }
    return Response(status: ResponseStatus.OK.name, message: "Recupération région", data: Region.fromMap(res.first));
  }

  // get the list of  departments
  static Future<Response> getDepartments() async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_DEPARTEMENT.name);
    return Response(status: ResponseStatus.OK.name, message: "Liste des départements", data: Department.fromList(res));
  }

  // search departments by name
  static Future<Response> searchDepartmentsByname(String name) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_DEPARTEMENT.name, where: 'nom LIKE ?', whereArgs: ['%$name%']);
    return Response(status: ResponseStatus.OK.name, message: "Liste des département", data: Department.fromList(res));
  }

  // get the liste of communes
  static Future<Response> getCommunes() async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_COMMUNE.name);
    return Response(status: ResponseStatus.OK.name, message: "Liste des communes", data: Commune.fromList(res));
  }

  // search commune by name
  static Future<Response> searchCommunesByName(String name) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_COMMUNE.name, where: 'nom LIKE ?' ,whereArgs: ['%$name%']);
    return Response(status: ResponseStatus.OK.name, message: "Liste des communes", data: Commune.fromList(res));
  }
  static Future<Response> getCommuneById(int id) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_COMMUNE.name, where:'id = ?', whereArgs: [id]);
    if(res.isEmpty){
      return Response(status: ResponseStatus.EXCEPTION.name, message: "Commune avec id $id n'existe pas.");
    }
    return Response(status: ResponseStatus.OK.name, message: "Recupèration commune", data: Commune.fromMap(res.first));
  }

  // get the list of  cities
  static Future<Response> getCities() async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_VILLE.name);
    return Response(status: ResponseStatus.OK.name, message: "Liste des villes", data: City.fromList(res));
  }

  // search cities
  static Future<Response> searchCitiesByName(String name) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_VILLE.name, where: 'nom LIKE ?', whereArgs: ['%$name%']);
    return Response(status: ResponseStatus.OK.name, message: "Liste des villes", data: City.fromList(res));
  }

  // get cities by department id
  static Future<Response> getCitiesByDepartmentId(int id) async{
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_VILLE.name, where: "departementid = ?", whereArgs: [id]);
    return Response(status: ResponseStatus.OK.name, message: "Liste des villes", data: City.fromList(res));
  }

  // get city by id
  static Future<Response> getCityById(int id) async{
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_VILLE.name, where: "id = ?", whereArgs: [id]);
    if(res.isEmpty){
      return Response(status: ResponseStatus.EXCEPTION.name, message: "Ville avec id $id n'existe pas.");
    }
    return Response(status: ResponseStatus.OK.name, message: "Recupèration ville", data: City.fromMap(res.first));
  }

  // get the liste of  districts
  static Future<Response> getDistricts() async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_QUARTIER.name);
    return Response(status: ResponseStatus.OK.name, message: "Liste des quartiers", data: District.fromList(res));
  }

  // search districts by name
  static Future<Response> searchDistrictsByName(String name) async {
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_QUARTIER.name, where: 'nom LIKE ?', whereArgs: ['%$name%']);
    return Response(status: ResponseStatus.OK.name, message: "Liste des quartiers", data: District.fromList(res));
  }

  // get Departments by ID region
  static Future<Response> getDepartmentsByRegionId(int id) async {
    final db = await DBHelper().database;
    var res = await db
        .query(TableEnum.TD_DEPARTEMENT.name, where: "regionid = ?", whereArgs: [id]);
    return Response(status: ResponseStatus.OK.name, message: "Liste des départements", data: Department.fromList(res));
  }

  static Future<Response> getDepartmentById(int id) async {
    final db = await DBHelper().database;
    var res = await db
        .query(TableEnum.TD_DEPARTEMENT.name, where: "id = ?", whereArgs: [id]);
    if(res.isEmpty){
      return Response(status: ResponseStatus.EXCEPTION.name, message: "Département avec id $id n'existe pas.");
    }
    return Response(status: ResponseStatus.OK.name, message: "Recupèration département", data: Department.fromMap(res.first));
  }

  // get communes by departement id
  static Future<Response> getCommunesByDepartmentId(int id) async {
    final db = await DBHelper().database;

    var res = await db.rawQuery('''
        SELECT * 
        FROM TD_COMMUNE c
        INNER JOIN TD_VILLE v ON c.villeid = v.id
        INNER JOIN TD_DEPARTEMENT d ON v.departementid = d.id
        WHERE v.departementid = ?
      ''', [id]);
    return Response(status: ResponseStatus.OK.name, message: "Liste des communes", data: Commune.fromList(res));
  }

  // get districts by commune id
  static Future<Response> getDistrictsByCommuneId(int id) async{
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_QUARTIER.name, where: "communeid = ?", whereArgs: [id]);
    return Response(status: ResponseStatus.OK.name, message: "Liste de quartiers", data: District.fromList(res));
  }

  // get district by id
  static Future<Response> getDistrictById(int id) async{
    final db = await DBHelper().database;
    var res = await db.query(TableEnum.TD_QUARTIER.name, where: "id = ?", whereArgs: [id]);
    if(res.isEmpty){
      return Response(status: ResponseStatus.EXCEPTION.name, message: "Quartier avec id $id n'existe pas.");
    }
    return Response(status: ResponseStatus.OK.name, message: "Recupèratioin quartier", data: District.fromMap(res.first));
  }

}
