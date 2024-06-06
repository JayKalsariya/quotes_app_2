import 'package:quotes_app_2/modals/quotes_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum fav {
  id,
}

class DbHelper {
  DbHelper._();

  static final DbHelper instance = DbHelper._();

  Logger logger = Logger();
  String tableName = "FavTable";
  String dbName = "Fav_Data.db";
  late String sql;

  late Database database;

  Future<void> initDb() async {
//DataBase Path
    String path = await getDatabasesPath();
    database = await openDatabase(
      "$path/$dbName",
//Version
      version: 1,
//OnCreate DataBase
      onCreate: (db, version) async {
//Create Table
        String Query = """CREATE TABLE $tableName(
      ${fav.id.name} INTEGER PRIMARY KEY
      );""";
//Execute Query
        db
            .execute(Query)
            .then((value) => logger.i("Table Created"))
            .onError((error, stackTrace) => logger.e(error.toString()));
      },
//On Upgrade DataBase
      onUpgrade: (db, v1, v2) {},
//On Downgrade DataBase
      onDowngrade: (db, v1, v2) {},
    );
  }

  String api =
      'https://famous-quotes4.p.rapidapi.com/random?category=all&count=1000';

  Future<List<Quote>> getQuotes() async {
    List<Quote> quotes = [];
    http.Response response = await http.get(Uri.parse(api), headers: {
      "X-RapidAPI-Key": "1cc858c08emsh095579cbe83dd16p122111jsn48bf8d7c1d94",
      "X-RapidAPI-Host": "famous-quotes4.p.rapidapi.com",
    });
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      quotes = data.map((e) => Quote.fromJson(e)).toList();
    }
    return quotes;
  }
}
