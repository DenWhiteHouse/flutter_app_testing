import 'package:equatable/equatable.dart';
import 'package:flutter_app_testing/network/book_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookState extends Equatable {
  BookState([List props = const []]) : super(props);
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

// Only the WeatherLoaded event needs to contain data
class BookLoaded extends BookState {
  final book_model book;

  BookLoaded(this.book) : super([book]);
}