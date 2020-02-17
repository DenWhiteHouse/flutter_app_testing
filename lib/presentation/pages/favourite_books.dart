
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/database/book.dart';
import 'package:flutter_app_testing/network/book_model.dart';

class FavouriteBooks extends StatefulWidget {
  final List<Book> books;
  FavouriteBooks(this.books);

  @override
  _FavouriteBooksState createState() => _FavouriteBooksState();
}

class _FavouriteBooksState extends State<FavouriteBooks> {
  final BooksDao booksDao = MyDatabase().booksDao;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourite Books"),
        ),
        body: ListView.builder(
            itemCount: widget.books.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(widget.books[i].bookTitle)));
  }
}

