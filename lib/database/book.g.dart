// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Book extends DataClass implements Insertable<Book> {
  final String bookTitle;
  Book({@required this.bookTitle});
  factory Book.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Book(
      bookTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}book_title']),
    );
  }
  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Book(
      bookTitle: serializer.fromJson<String>(json['bookTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'bookTitle': serializer.toJson<String>(bookTitle),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Book>>(bool nullToAbsent) {
    return BooksCompanion(
      bookTitle: bookTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(bookTitle),
    ) as T;
  }

  Book copyWith({String bookTitle}) => Book(
        bookTitle: bookTitle ?? this.bookTitle,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')..write('bookTitle: $bookTitle')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(bookTitle.hashCode);
  @override
  bool operator ==(other) =>
      identical(this, other) || (other is Book && other.bookTitle == bookTitle);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<String> bookTitle;
  const BooksCompanion({
    this.bookTitle = const Value.absent(),
  });
  BooksCompanion copyWith({Value<String> bookTitle}) {
    return BooksCompanion(
      bookTitle: bookTitle ?? this.bookTitle,
    );
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  final GeneratedDatabase _db;
  final String _alias;
  $BooksTable(this._db, [this._alias]);
  final VerificationMeta _bookTitleMeta = const VerificationMeta('bookTitle');
  GeneratedTextColumn _bookTitle;
  @override
  GeneratedTextColumn get bookTitle => _bookTitle ??= _constructBookTitle();
  GeneratedTextColumn _constructBookTitle() {
    return GeneratedTextColumn('book_title', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [bookTitle];
  @override
  $BooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'books';
  @override
  final String actualTableName = 'books';
  @override
  VerificationContext validateIntegrity(BooksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.bookTitle.present) {
      context.handle(_bookTitleMeta,
          bookTitle.isAcceptableValue(d.bookTitle.value, _bookTitleMeta));
    } else if (bookTitle.isRequired && isInserting) {
      context.missing(_bookTitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Book map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Book.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BooksCompanion d) {
    final map = <String, Variable>{};
    if (d.bookTitle.present) {
      map['book_title'] = Variable<String, StringType>(d.bookTitle.value);
    }
    return map;
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $BooksTable _books;
  $BooksTable get books => _books ??= $BooksTable(this);
  BooksDao _booksDao;
  BooksDao get booksDao => _booksDao ??= BooksDao(this as MyDatabase);
  @override
  List<TableInfo> get allTables => [books];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$BooksDaoMixin on DatabaseAccessor<MyDatabase> {
  $BooksTable get books => db.books;
}
