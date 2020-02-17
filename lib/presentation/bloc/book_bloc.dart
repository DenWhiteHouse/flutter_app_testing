import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter_app_testing/network/book_api_provider.dart';
import 'package:flutter_app_testing/presentation/bloc/book_event.dart';
import 'package:flutter_app_testing/presentation/bloc/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  @override
  BookState get initialState => BookInitial();

  @override
  Stream<BookState> mapEventToState(
      BookEvent event,
      ) async* {
    print('Sono quiiii');
    if (event is GetBook) {
      print('Sono quiiii2');
      yield BookLoading();
      final book = await BookApiProvider().getBook();
      yield BookLoaded(book);
    }
  }

}