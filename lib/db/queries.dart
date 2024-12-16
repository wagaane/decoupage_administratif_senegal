import 'package:decoupage_administratif_senegal/models/departement.dart';
import 'package:decoupage_administratif_senegal/models/quartier.dart';
import 'package:decoupage_administratif_senegal/models/ville.dart';
import '../models/commune.dart';
import '../models/region.dart';
import 'db_helper.dart';

class Queries {
  // Get the list of the regions
  static Future<List<Region>> getRegions() async {
    final db = await DBHelper().database;
    var res = await db.query('TD_REGION');
    return Region.fromList(res);
  }

  // get region by id
  static Future<Region> getRegionById(int id) async {
    final db = await DBHelper().database;
    var res = await db.query('TD_REGION', where: "id = ?", whereArgs: [id]);
    return Region.fromMap(res.first);
  }



  // get the list of the departments
  static Future<List<Department>> getDepartments() async {
    final db = await DBHelper().database;
    var res = await db.query('TD_DEPARTEMENT');
    return Department.fromList(res);
  }

  // get the liste og communes
  static Future<List<Commune>> getCommunes() async {
    final db = await DBHelper().database;
    var res = await db.query('TD_COMMUNE');
    return Commune.fromList(res);
  }
  static Future<Commune> getCommuneById(int id) async {
    final db = await DBHelper().database;
    var res = await db.query('TD_COMMUNE', where:'id = ?', whereArgs: [id]);
    return Commune.fromMap(res.first);
  }

  // get the list of the cities
  static Future<List<City>> getCities() async {
    final db = await DBHelper().database;
    var res = await db.query('TD_VILLE');
    return City.fromList(res);
  }

  // get cities by department id
  static Future<List<City>> getCitiesByDepartmentId(int id) async{
    final db = await DBHelper().database;
    var res = await db.query("TD_VILLE", where: "departementid = ?", whereArgs: [id]);
    return City.fromList(res);
  }

  // get city by id
  static Future<City> getCityById(int id) async{
    final db = await DBHelper().database;
    var res = await db.query("TD_VILLE", where: "id = ?", whereArgs: [id]);
    return City.fromMap(res.first);
  }

  // get the liste of the districts
  static Future<List<District>> getDistricts() async {
    final db = await DBHelper().database;
    var res = await db.query('TD_QUARTIER');
    return District.fromList(res);
  }

  // get Departments by ID region
  static Future<List<Department>> getDepartmentsByRegionId(int id) async {
    final db = await DBHelper().database;
    var res = await db
        .query("TD_DEPARTEMENT", where: "regionid = ?", whereArgs: [id]);
    return Department.fromList(res);
  }
  static Future<Department> getDepartmentById(int id) async {
    final db = await DBHelper().database;
    var res = await db
        .query("TD_DEPARTEMENT", where: "id = ?", whereArgs: [id]);
    return Department.fromMap(res.first);
  }

  // get communes by departement id
  static Future<List<Commune>> getCommunesByDepartmentId(int id) async {
    final db = await DBHelper().database;

    var res = await db.rawQuery('''
        SELECT * 
        FROM TD_COMMUNE c
        INNER JOIN TD_VILLE v ON c.villeid = v.id
        INNER JOIN TD_DEPARTEMENT d ON v.departementid = d.id
        WHERE v.departementid = ?
      ''', [id]);
    return Commune.fromList(res);
  }

  // get districts by commune id
  static Future<List<District>> getDistrictsByCommuneId(int id) async{
    final db = await DBHelper().database;
    var res = await db.query("TD_QUARTIER", where: "communeid = ?", whereArgs: [id]);
    return District.fromList(res);
  }
  static Future<District> getDistrictById(int id) async{
    final db = await DBHelper().database;
    var res = await db.query("TD_QUARTIER", where: "id = ?", whereArgs: [id]);
    return District.fromMap(res.first);
  }





}
