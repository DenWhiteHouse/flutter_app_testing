import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/network/book_model.dart';
import 'package:flutter_app_testing/presentation/widgets/search_bar.dart';

class BookPage extends StatelessWidget {
  final book_model book;

  BookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 180,
            padding: EdgeInsets.all(16),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Image.network(
                      '${book.items[0].volumeInfo.imageLinks.smallThumbnail}',
                      //fit: BoxFit.fill,
                    ),
                    constraints: BoxConstraints(
                        maxHeight: 180.0,
                        maxWidth: 180.0,
                        minWidth: 170.0,
                        minHeight: 170.0),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText('${book.items[0].volumeInfo.title}',
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(
                          height: 20,
                        ),
                        Text('N.Pages: ${book.items[0].volumeInfo.pageCount}'),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: AutoSizeText(
                              '${book.items[0].volumeInfo.description}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 10)),
                        )
                      ],
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
      return [IconButton(icon: Icon(Icons.clear),onPressed: (){},)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon:AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed:(){});
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}