import 'package:flutter_app_testing/network/book_model.dart';

import 'book_api_provider.dart';

class BookRepository{
  BookApiProvider _apiProvider = BookApiProvider();

  Future<book_model> getBook(){
    return _apiProvider.getBook();
  }
}