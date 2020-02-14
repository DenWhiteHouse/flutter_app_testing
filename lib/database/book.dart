import 'package:moor_flutter/moor_flutter.dart';
part   'book.g.dart';

class Books extends Table{
  TextColumn get bookTitle =>
      text().named('book_title').customConstraint('UNIQUE')();
}

@UseMoor(tables: [Books])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
  ));  @override
  int get schemaVersion => 1;
}