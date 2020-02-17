import 'book_model.dart';
import 'package:dio/dio.dart';

class BookApiProvider{

  String _endpoint = "https://www.googleapis.com/books/v1/volumes?q=";
  final Dio _dio = Dio();
/*
  Future<book_model> getBookByName(String film) async {

    this._endpoint = _endpoint+film;

    try {
      Response response = await _dio.get(this._endpoint);
      print(response);
      return book_model.fromJson(response.data);

    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return book_model.withError("$error");
    }
  }
*/

  Future<book_model> getBook() async {

    this._endpoint = "https://www.googleapis.com/books/v1/volumes?q=Games+of+thrones";

    try {
      Response response = await _dio.get(this._endpoint);
      print(response);
      return book_model.fromJson(response.data);

    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return book_model.withError("$error");
    }
  }


}