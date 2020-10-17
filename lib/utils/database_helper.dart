import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:fire/model/imagesmodel.dart';
class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String gameTable='pubg';
  String id='id';
  String gametitle='gametitle';
  String image='img';
  String gameplatform='gameplatform';
  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper==null)
    {
      print("nullprogram");
      _databaseHelper=DatabaseHelper._createInstance();}
    return _databaseHelper;
  }
  Future<Database>get database async{
  
     if(_database==null)
     {  print("sdsdzd");
       _database=await initilizeDatabase();
     }
    return _database;
  }
  Future<Database>initilizeDatabase()async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path=directory.path+'firstfinalbeta.db';
    var loadimagesDatabase=await openDatabase(path,version:1 ,onCreate: _createDb);
    return loadimagesDatabase;
  }
  void _createDb(Database db,int newVersion)async{
    await db.execute(
      'CREATE TABLE $gameTable($id INTEGER PRIMARY KEY AUTOINCREMENT,$gametitle TEXT,imggg BLOB,gameplatform TEXT)');
  }
  Future<List<Map<String,dynamic>>> getLoadImageMapList(String tablename)async{
   Database db=await this.database;
    
   //var result=await db.rawQuery('SELECT * FROM $gameTable order by $gametitle pubgmobile');
   try{var result=await db.query(tablename,orderBy: 'id' );
  return result;}catch(ss){
    print("error in getting");
     print(ss);
    return null;

  }
  }
  Future<int>insertMapList(LoadImages loadimages,String tablename)async{
    try{
     // print(loadimages.toMap());
    Database db=await this.database;
    var result = await db.insert(tablename, loadimages.toMap());
    return result;}catch(e){print("fxfxcx");}
  }
  Future<void>createnewtable(String tablename)async{
  try{  Database db=await this.database;
     db.transaction((txn)=>txn.execute( 'CREATE TABLE $tablename($id INTEGER PRIMARY KEY AUTOINCREMENT,gametitle TEXT,imggg BLOB,gameplatform TEXT)'));}
 catch(ii){print("error");
 print(ii);}
  }
}