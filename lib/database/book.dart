import 'package:moor_flutter/moor_flutter.dart';

part 'book.g.dart';

class Books extends Table {
  TextColumn get bookTitle =>
      text().named('book_title').customConstraint('UNIQUE')();
}

@UseMoor(tables: [Books], daos: [BooksDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
        ));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Books])
class BooksDao extends DatabaseAccessor<MyDatabase> with _$BooksDaoMixin {
  BooksDao(MyDatabase db) : super(db);

  Future<List<Book>> get allWatchingModes => select(books).get();

  Stream<List<Book>> get watchAllModes => select(books).watch();

  ///Adds a new Book
  void addBook({String bookTitle}) {
    final _entry = BooksCompanion(
      bookTitle: Value(bookTitle),
    );
    into(books).insert(_entry);
  }
}
