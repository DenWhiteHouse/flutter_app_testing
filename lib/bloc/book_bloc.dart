import 'package:rxdart/rxdart.dart';
import 'package:flutter_app_testing/network/book_model.dart';
import 'package:flutter_app_testing/network/book_repository.dart';

class BookBloc {
  final BookRepository _repository = BookRepository();
  final BehaviorSubject<book_model> _subject =
  BehaviorSubject<book_model>();

  getBook() async {
    book_model response = await _repository.getBook();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<book_model> get subject => _subject;

}
final bloc = BookBloc();