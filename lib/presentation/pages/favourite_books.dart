
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/database/book.dart';
import 'package:flutter_app_testing/network/book_model.dart';

class FavouriteBooks extends StatefulWidget {
  @override
  _FavouriteBooksState createState() => _FavouriteBooksState();
}

class _FavouriteBooksState extends State<FavouriteBooks> {
  final BooksDao booksDao = MyDatabase().booksDao;
  List<Book> books;

  @override
  void initState() {
    super.initState();
    booksDao.allBooks.then((value){
      this.books = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourite Books"),
        ),
        body: ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(books[i].bookTitle)));
      }

      
}
