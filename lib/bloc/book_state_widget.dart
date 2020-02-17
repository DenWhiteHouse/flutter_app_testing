import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_testing/network/book_model.dart';
import 'package:flutter_app_testing/presentation/pages/BookPage.dart';
import 'package:flutter_app_testing/presentation/pages/favourite_books.dart';
import 'book_bloc.dart';

class BookWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookWidgetState();
  }
}

class _BookWidgetState extends State<BookWidget> {

  @override
  void initState() {
    super.initState();
    bloc.getBook();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<book_model>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<book_model> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0){
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildBookWidget(snapshot.data);

        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle), CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Error occured: $error",
          style: Theme.of(context).textTheme.subtitle),],
        ));
  }

  Widget _buildBookWidget(book_model data) {
    return BookPage(data);
  }

}