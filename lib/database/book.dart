import 'package:moor_flutter/moor_flutter.dart';
part   'tables.g.dart';

class Books extends Table{
  TextColumn get bookTitle =>
      text().named('book_title').customConstraint('UNIQUE')();
}

@UseMoor(tables: [Books])
class MyDatabase {

}