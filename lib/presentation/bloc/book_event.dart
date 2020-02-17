import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookEvent extends Equatable {
  BookEvent([List props = const []]) : super(props);
}

// The only event in this app is for getting the weather
class GetBook extends BookEvent {
  final String bookName;

  GetBook(this.bookName) : super([bookName]);
}