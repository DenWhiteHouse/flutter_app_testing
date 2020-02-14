import 'book_model.dart';
import 'package:dio/dio.dart';

class BookApiProvider{
  final String _endpoint = "https://www.googleapis.com/books/v1/volumes?q=Games+of+thrones";
  final Dio _dio = Dio();

  Future<book_model> getBook() async {
    try {
      Response response = await _dio.get(_endpoint);
      print(response);
      return book_model.fromJson(response.data);

    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return book_model.withError("$error");
    }
  }
}