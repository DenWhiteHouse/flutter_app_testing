import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter_app_testing/network/book_api_provider.dart';
import 'package:flutter_app_testing/presentation/bloc/book_event.dart';
import 'package:flutter_app_testing/presentation/bloc/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  @override
  BookState get initialState => BookInitial();

  // Under the hood, the Bloc library works with regular Dart Streams.
  // The "async*" makes this method an async generator, which outputs a Stream
  @override
  Stream<BookState> mapEventToState(
      BookEvent event,
      ) async* {
    print('Sono quiiii');
    // Distinguish between different events, even though this app has only one
    if (event is GetBook) {
      print('Sono quiiii2');
      // Outputting a state from the asynchronous generator
      yield BookLoading();
      final book = await BookApiProvider().getBook();
      yield BookLoaded(book);
    }
  }

}