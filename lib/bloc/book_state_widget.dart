import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_testing/network/book_model.dart';
import 'package:flutter_app_testing/presentation/bloc/book_state.dart';
import 'package:flutter_app_testing/presentation/pages/BookPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_bloc.dart';
import 'package:flutter_app_testing/presentation/bloc/book_bloc.dart';

class BookWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookWidgetState();
  }
}

class _BookWidgetState extends State<BookWidget> {
  final weatherBloc = BookBloc();

  @override
  void initState() {
    super.initState();
    // bloc.getBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: weatherBloc,
          builder: (BuildContext context, BookState state) {
            if (state is BookInitial) {
              print('INITIAL');
              return _buildLoadingWidget();
            } else if (state is BookLoading) {
              print('LOADING');
              return _buildLoadingWidget();
            } else if (state is BookLoaded) {
              print('LOADED');
              return _buildBookWidget(state.book);
            }
            return Container();
          }),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle),
        CircularProgressIndicator()
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.subtitle),
      ],
    ));
  }

  Widget _buildBookWidget(book_model data) {
    return BookPage(data);
  }
}
